Testpilot::Application.routes.draw do

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  scope :api, constraints: {format: :json} do
    resource :user, only: :show
    resources :apps, only: [:index, :show, :create] do
      resources :builds, :only => [:index, :show, :create]
      resources :assignments
      resource  :icon, only: [:show], controller: :application_icon do
        get :thumb
      end
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
