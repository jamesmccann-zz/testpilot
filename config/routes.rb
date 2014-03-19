Testpilot::Application.routes.draw do

  scope :api, constraints: {format: :json} do
    resources :apps, only: [:index, :show] do
      resources :builds, :only => [:show, :create]
    end
  end

  root 'testpilot#show'

end
