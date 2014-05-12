CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.fog_use_ssl_for_aws = false
  config.fog_attributes = {'Cache-Control' => 'max-age=3600'}
end

