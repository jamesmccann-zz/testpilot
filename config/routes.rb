Testpilot::Application.routes.draw do

  scope :api, constraints: {format: :json} do
    resources :apps, only: [:index, :show] do
      resources :builds, :only => [:new, :create] do
        member do
          get :download
        end
      end
    end
  end

  root 'testpilot#show'

end
