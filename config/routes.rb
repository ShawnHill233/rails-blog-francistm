FrancisBlog::Application.routes.draw do
  namespace :pages do
    get "links"
    get "archive"
  end

  root :to => "home#index"
end
