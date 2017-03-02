Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :games
      resources :users
      resource :password

      post 'user_token' => 'user_token#create'
      # For details on the DSL available within this file,
      # see http://guides.rubyonrails.org/routing.html
    end
  end
end
