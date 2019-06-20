Rails.application.routes.draw do
  resources :needs
  resources :institutions
  root to: 'pages#home'

  get "/search" => "pages#search"
  get "/criadores" => "pages#criadores"
  get "/contato" => "pages#contato"
end
