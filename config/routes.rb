Rails.application.routes.draw do
  resources :needs
  resources :institutions
  root to: 'pages#home'

  get "/search" => "pages#search"
end
