Rails.application.routes.draw do
  resources :games
  resources :users do
    resources :games
  end

  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end
