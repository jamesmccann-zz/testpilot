class APKUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(apk)
  end

  def filename
    "#{model.app_name}-#{model.number}" if original_filename
  end

end

