FrancisBlog::Application.routes.draw do
  namespace :pages do
    get "links"
    get "archive"
  end

  root :to => "home#index"
  get "feed" => "home#feed"

  resources :entries, :only => [:show]
end
