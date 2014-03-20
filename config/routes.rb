Testpilot::Application.routes.draw do

  scope :api, constraints: {format: :json} do
    resources :apps, only: [:index, :show] do
      resources :builds, :only => [:index, :show, :create]
    end
  end

  if Rails.env.draft? || Rails.env.production?
    offline = Rack::Offline.configure :cache_interval => 120 do
      cache ActionController::Base.helpers.asset_path("application.css")
      cache ActionController::Base.helpers.asset_path("application.js")
      network "/"
    end

    get "/application.manifest" => offline
  end

  root 'testpilot#show'

end
