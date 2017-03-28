class V1::ImagesController < ApplicationController
  def resize
    image_id = params[:image_id].to_s
    height = params[:height].to_i
    width  = params[:width].to_i
    error("Required parameters not met!") unless V1::ImageService.validate_resize_params(image_id, height, width)

    image = Dragonfly.app.fetch_url(V1::ImageService.parse_img_url(image_id))
    height = nil if height == 0
    width  = nil if width == 0
    resized_image = image.thumb("#{width}x#{height}")
    uid = resized_image.store
    ok({ image_url: Dragonfly.app.remote_url_for(uid) })
  end
end
