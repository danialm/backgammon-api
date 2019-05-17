Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :games do
        scope module: "games" do
          resource :offer
          resource :response
        end
      end
      resources :users
      resource :password

      post 'user_token' => 'user_token#create'

      # For details on the DSL available within this file,
      # see http://guides.rubyonrails.org/routing.html

      mount ActionCable.server => '/cable'
    end
  end
end
