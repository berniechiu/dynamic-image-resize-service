class V1::ConversionController < ApplicationController
  def resize
    target_image_url = params[:image_url].to_s
    height = params[:height].to_i
    width  = params[:width].to_i
    return render status: :error if target_image_url.blank? || height.blank? || width.blank?

    image = Dragonfly.app.fetch_url(target_image_url)
    resized_image = image.thumb("#{width}x#{height}")
    uid = resized_image.store
    render status: :ok, json: { image_url: Dragonfly.app.remote_url_for(uid) }
  end
end
