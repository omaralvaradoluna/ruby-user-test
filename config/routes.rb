Rails.application.routes.draw do
  post 'users/index' # for list all users in the database, only allowed for authenticated users
  post 'users/view'
  post 'users/authenticated'
  post 'users/logout'
  post 'users/new'
  post 'users/create'
  get 'users/new'
  post 'users/signin' # for create a users
  post 'users/authentication' # For authenticate already registered users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
