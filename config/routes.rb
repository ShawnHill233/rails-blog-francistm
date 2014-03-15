FrancisBlog::Application.routes.draw do
  namespace :pages do
    get "links"
    get "archive"
  end

  namespace :admin do
    get "/" => "admin#index"

    get "login" => "sessions#new"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"

    get "settings/stat" => "settings#stat"
    put "settings/stat" => "settings#stat_update"

    resources :attachments
    resources :entries, except: [:show]
  end

  root :to => "home#index"
  get "feed" => "home#feed"

  resources :entries, only: [:show]
end
