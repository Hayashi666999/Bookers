Rails.application.routes.draw do
  get 'books/new'
  get 'books/edit'
  
  post 'books' => 'books#create'   #ここを追記します
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show'
  get '/top' => 'homes#top'
 resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end