Rails.application.routes.draw do
  namespace :v1, constraints: { format: 'json' } do
    post '/resize', to: 'conversion#resize'
  end
end
