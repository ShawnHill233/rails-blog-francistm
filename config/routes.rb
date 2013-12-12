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

    resources :entries, expect: [:show]
    resources :attachments, expect: [:update]
  end

  root :to => "home#index"
  get "feed" => "home#feed"

  resources :entries, only: [:show]
end
