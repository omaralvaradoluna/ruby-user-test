Rails.application.routes.draw do
  get 'users/index' # for list all users in the database, only allowed for authenticated users
  post 'users/signin' # for create a users
  delete 'users/session' # 
  get 'users/session' #
  post 'users/authentication' # For authenticate already registered users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
