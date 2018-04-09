# frozen_string_literal: true

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :default do
    process resize_to_limit: [110, 110]
  end

  version :thumb, from_version: :default do
    process resize_to_limit: [75, 75]
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
