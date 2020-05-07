Rails.application.routes.draw do

	root 'home#top'
  devise_for :users
  resources :users, only:[:show, :edit, :update]
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
