class V1::ImagesController < ApplicationController
  def resize
    target_image_url = params[:image_url].to_s
    height = params[:height].to_i
    width  = params[:width].to_i
    error("Required parameters not met!") if target_image_url.blank? || height.blank? || width.blank?

    image = Dragonfly.app.fetch_url(target_image_url)
    resized_image = image.thumb("#{width}x#{height}")
    ok({ image_url: resized_image.url })
  end
end
