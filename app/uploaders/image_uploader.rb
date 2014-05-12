class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [700, 700]
  process convert: 'jpg'

  version :thumb do
    process resize_to_limit: [300, 300]
  end

  def extention_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    (Time.now.strftime('%Y%m%d%H%M%S') + '.jpg').downcase
  end

  # S3 Storage
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
