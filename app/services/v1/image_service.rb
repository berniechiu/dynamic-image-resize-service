class V1::ImageService
  RESIZE_LIMIT = 50

  def self.parse_img_url(id)
    "https://img.shoplineapp.com/media/image_clips/#{id}/original.jpg"
  end

  def self.validate_resize_params(id, height, width)
    return false if id.blank?
    return false if (height < RESIZE_LIMIT) && (width < RESIZE_LIMIT)
    true
  end
end
