class InkImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	def default_url
    'ink_placeholder.jpeg'
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end