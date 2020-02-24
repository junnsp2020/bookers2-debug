Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
  	resource :favorites
  	resource :book_comments
  end
  root 'home#top'
  # get 'home#about'
  get "home/about" => "home#about"

end
