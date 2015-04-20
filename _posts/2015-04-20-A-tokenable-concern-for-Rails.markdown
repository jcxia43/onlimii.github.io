---
layout: post
title: "A tokenable concern for Rails"
date: 2015-04-20 20:44
comments: true
categories: [rails coding]
---

### Hi I’m your token: `abc123`
Unique token in a table is very common in different use cases. This post is about writing a sharable concern in the Rails project, which can generate unique tokens for models with some customizable options.

### Generate a simple token
A simple way to generate token in ruby could be:

	(0..10).to_a.shuffle.join
	=> "910235810467"

This way you can generate a random string combined with pure numbers. But this is not enough, because numbers are too limited and can be easily cracked. So we need to mix more characters, symbols and letters. A more decent token should have numbers, letters and symbols, which makes the cracking a bit harder. Also since the token will usually be using during the web transactions, so the generated string should always be url safe, which means you should not include `$&+,/:;=?@` based on [RFC-1738][1].
Ruby has a built-in library to do the dirty work for us, which is [SecureRandom][2]. SecureRandom can generate random hex strings, bytes strings, UUID and etc.

	p SecureRandom.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
	p SecureRandom.urlsafe_base64 #=> "UZLdOkzop70Ddx-IJR0ABg"

### Create a concern
Here, for example, using the `SecureRandom.urlsafe_base64`, we can write a simple concern for models, which guarantees to generate a unique token when instantiating models.

	module Tokenable
	  extend ActiveSupport::Concern

	  included do
	    before_create :generate_token
	  end

	  protected

	  def generate_token
	    # make sure the random token not existed in current table
	    self.token = loop do
	      random_token = SecureRandom.urlsafe_base64
	      break random_token unless self.class.exists?(token: random_token)
	    end
	  end

	end

The concern above should be stored in `app/models/concerns` and works for models with a column name `token`. To use the concern, simply including this concert into the model and you are good to go.

### Add more options
For most cases, the `Tokenable` concern above should be enough. But more customizability would be better. What if we can do something like:

	class Order < ActiveRecord::Base

	    include Tokenable
	    token_length 32
	    token_prefix 'charge_'
	    ...
	end

That would be nice! Being able to configure length and prefix for different models. So what we need to do is to add two class methods `token_length` and `token_prefix` to the model class. Change `Tokenable` a little bit:

	module Tokenable
	  extend ActiveSupport::Concern

	  included do
	    before_create :generate_token
	    class << self
	      attr_accessor :tokenable_token_length, :tokenable_token_prefix
	      def token_length(length=20)
	        self.tokenable_token_length = (length / 4.0 * 3).to_i
	        # the maths stuff can be found in SecureRandom doc
	      end

	      def token_prefix(prefix='')
	        self.tokenable_token_prefix = prefix
	      end
	    end
	  end

	  protected

	  def generate_token
	    self.token = loop do
	      random_token = "#{self.class.tokenable_token_prefix}#{SecureRandom.urlsafe_base64(self.class.tokenable_token_length, false)}"
	      break random_token unless self.class.exists?(token: random_token)
	    end
	  end

	end

Now, we added two options for the concern which is handy when applying to different models.

[1]:	http://www.rfc-base.org/rfc-1738.html
[2]:	http://ruby-doc.org/stdlib-1.9.3/libdoc/securerandom/rdoc/SecureRandom.html
