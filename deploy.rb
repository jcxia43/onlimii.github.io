require 'aws-sdk-s3'
require 'mimemagic'

s3 = Aws::S3::Resource.new(region:'ap-northeast-1', access_key_id: ENV['AWS_PERSONAL_KEY_ID'], secret_access_key: ENV['AWS_PERSONAL_KEY_SECRET'])

Dir['_site/**/*'].each do |f|
  if (!Dir.exist?(f))
    content_type = MimeMagic.by_path(f).to_s
    options = {
      cache_control: "public, max-age=600",
      content_type: MimeMagic.by_path(f).to_s,
      acl: "public-read"
    }
    basename = File.basename(f)
    if (basename != 'index.html')
      basename.sub!('.html', '')
    end
    s3.bucket('jcxia.com').object(basename).upload_file(f, options)
    puts "uploading #{basename}"
  end
end