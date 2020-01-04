Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_images do
  	resource :likes, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
end
  resources :users
  resources :users do
    member do
     get :following, :followers
    end
end
  resources :browsing_histories
  resources :relationships, only: [:create, :destroy]

  root 'post_images#index'
  get "search" => "post_images#search"
  get "users/:id/browsing_histories" => "users#browsing_histories"

end
