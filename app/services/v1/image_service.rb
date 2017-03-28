class V1::ImageService
  RESIZE_LIMIT = 50.freeze
  SUPPORTED_FORMATS = ['jpg', 'png'].freeze

  def self.parse_img_url(id, format)
    format = format if SUPPORTED_FORMATS.include?(format)
    format = 'jpg'  if format.blank?
    "https://img.shoplineapp.com/media/image_clips/#{id}/original.#{format}"
  end

  def self.validate_resize_params(id, height, width)
    return false if id.blank?
    return false if (height < RESIZE_LIMIT) && (width < RESIZE_LIMIT)
    true
  end
end
