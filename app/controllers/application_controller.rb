class ApplicationController < ActionController::API
  def error(message)
    return render status: :error, json: { message: message }
  end

  def ok(data = {})
    return render status: status, json: data
  end
end
