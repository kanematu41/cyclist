Rails.application.routes.draw do

	root 'home#top'

  devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :users, only:[:index, :show]
    resources :posts, only:[:show, :destroy] do
      member do
        get :list
      end
    end
  end

  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only:[:show, :edit, :update] do
    member do
      get :follows
      get :followers
      get :timeline
    end
  end
  resources :posts do
  	resource :comments, only:[:create, :destroy]
  	resource :likes, only:[:create, :destroy]
  end
  resources :searchs, only:[:index] do
    collection do
      get :tag
    end
  end
  resources :notifications, only:[:index, :destroy]
  resources :chats, only: [:show, :create]
  post 'follow/:id' => 'relationships#create', as: 'follow'
  delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
