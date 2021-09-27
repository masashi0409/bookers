Rails.application.routes.draw do
  get 'books/index'
  post 'books/index' => 'books#create'
  get 'books/show'
  get 'books/edit'
  root :to => 'homes#index'
  get 'homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
end
