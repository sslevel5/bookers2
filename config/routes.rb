Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :books
  end

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]


  get '/home/about' => 'homes#about'
end
