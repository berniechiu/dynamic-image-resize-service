Rails.application.routes.draw do
  namespace :v1, constraints: { format: 'json' } do
    resource :images, only: [] do
      get '/:image_id', to: 'images#resize'
    end
  end
end
