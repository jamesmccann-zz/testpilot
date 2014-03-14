Testpilot::Application.routes.draw do

  resources :apps do
    resources :builds, :only => [:new, :create] do
      get 'apk' => 'builds#apk_download'
    end
    member do
      get 'builds'
    end
  end

  root 'apps#index'

end
