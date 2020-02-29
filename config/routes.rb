Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }
  resources :users do
    resource :relationships, only:[:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
  	resource :favorites
  	resource :book_comments
  end
  root 'home#top'
  # get 'home#about'
  get "home/about" => "home#about"

  # get '/search', to: 'searchs#search'
  get '/search' => 'search#search'

end
