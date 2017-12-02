


class UsersController < ApplicationController
  def index
      @currentUser = User.find(1)
      @users = User.all
      
  end

  def login
      
  end 
end
