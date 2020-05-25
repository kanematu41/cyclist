class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # 環境による保存先の指定
  # if Rails.env.development?
  #   storage :file
  # elsif Rails.env.test?
  #   storage :file
  # else
  #   storage :fog
  # end

  # Choose what kind of storage to use for this uploader:
  # テスト環境
  # storage :file
  # 本番環境
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # rspecで追加(分岐)
  if Rails.env.test?
    def store_dir
      "uploads_test/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  else
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # 同じ画像が表示されたためコメントアウト
  # def filename
  #   "#{secure_token}.#{file.extension}" if original_filename.present?
  # end

  protected

  def secure_token
     var = :"@#{mounted_as}_secure_token"
     model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end