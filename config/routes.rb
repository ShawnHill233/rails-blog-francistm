FrancisBlog::Application.routes.draw do

  resources :entries, :only => [:show]

  namespace :pages do
    get "links"
    get "archive"
  end

  root :to => "home#index"
end
