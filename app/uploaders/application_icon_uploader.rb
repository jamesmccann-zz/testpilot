# encoding: utf-8

class ApplicationIconUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "private/uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    ActionController::Base.helpers.asset_url("fallback/" + [mounted_as, version_name, "default.png"].compact.join('_'))
  end

  # Process files as they are uploaded:
  process :resize_to_fit => [512, 512]


  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [48, 48]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "icon.png" if original_filename
  end

end
