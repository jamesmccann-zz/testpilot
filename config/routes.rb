Testpilot::Application.routes.draw do

  scope :api, constraints: {format: :json} do
    resources :apps, only: [:index, :show] do
      resources :builds, :only => [:index, :show, :create]
    end
  end

  root 'testpilot#show'

end
