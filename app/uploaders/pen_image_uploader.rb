class PenImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	def default_url
    'pen_placeholder.jpg'
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end
