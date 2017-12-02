class UsersController < ApplicationController

  protect_from_forgery :except => [:authentication, :index]

  def index
      @currentUser = User.find(1)
      @users = User.all
      if params[:type] == 'json' then
       	 res = [
      	      200,
	      "Ok",
	      @users
      	      ]
      	render json: res
      end	 

  end

  def authentication
      username = params[:username]
      user = User.find_by(username: username)

      if user.authenticate(params[:password]) then
	result = {
      	            "status" => 200,
	     	    "msg" => "Success"	    
      		    }
      else
	result = {
	  "status" => 404,
	  "msg" => "failed"
	}
      end
      render json: result
  end
      
  def view
        @user = User.find(1)
        render json: @user
  end 
      
end
