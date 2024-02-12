class PenImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	def default_url
    'pen_placeholder.webp'
  end

  process resize_to_limit: [600, 600]

  def extension_whitelist
    %w(jpg jpeg gif png heic webp)
  end

  process :convert_to_webp

  def convert_to_webp
    manipulate! do |img|
      img.format 'webp'
      img
    end
  end

  def filename
    super.chomp(File.extname(super)) + '.webp' if original_filename.present?
  end
end
