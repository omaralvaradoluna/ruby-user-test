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
        begin
		id = params[:id]
        	@user = User.find(id)
		render json: [
		         200,
		         "Ok",
		         @user
		       ]
	rescue ActiveRecord::RecordNotFound => e
  	       render json: [
	       	      404,
		      "User not found"		      
	       ]
  	end 
   end
      
end
