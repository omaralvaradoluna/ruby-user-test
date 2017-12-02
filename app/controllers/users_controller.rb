require 'jwt'

class UsersController < ApplicationController

	protect_from_forgery :except => [:authentication, :index]

	@@jwt_secret = '324'

	# Displays a list of all users if current is authenticated
	# When type=json GET parameter is passed, result is in json format
	def index
		token = params[:token]
		if self.validateToken(token) then
			self.display_users
		else
			res = [
					'status' => 404,
					'msg' => 'Not logged'
			]
			render json: res
		end
	end

	def display_users
		@users = User.all
		if params[:type] == 'json' then
			res = [
					'status' => 200,
					'msg' => 'Ok',
					'data' => @users
			]
			render json: res
		end
	end

	def authenticated
		user = User.find_by(token: params[:token])
		if user then
			decoded_token = JWT.decode user.token, @@jwt_secret, true, {:algorithm => 'HS256'}
			render json: decoded_token
		else
			res = [
					'status' => 404,
					'msg' => 'Not logged'
			]
			render json: res
		end

	end

	def logout
		user = User.find_by(token: params[:token])
		if user then
			user.token = ''
			user.save
			res = [
					'status' => 200,
					'msg' => 'success'
			]
			render json: res
		else
			res = [
					'status' => 401,
					'msg' => 'Not logged'
			]
			render json: res
		end
	end

	def new

	end

	def create
		if params[:password] != params[:password_confirmation]
			render error
		end
		@user = User.new
		@user.username = params[:username]
		@user.email = params[:email]
		@user.password = params[:password]

		if @user.save
			render success
		else
			render error
		end
	end

	def error

	end

	def success

	end

	def authentication
		username = params[:username]
		user = User.find_by(username: username)

		if user.authenticate(params[:password]) then
			payload = [
					"username" => user.username
			]
			user.token = JWT.encode payload, @@jwt_secret, 'HS256'
			user.save
			result = {
					'status' => 200,
					'msg' => 'Success',
					'token' => user.token
			}
		else
			result = {
					'status' => 401,
					'msg' => 'failed'
			}
		end
		render json: result
	end

	def validateToken(token)
		token = params[:token]
		if token.nil? then
			return false
		end
		user = User.find_by(token: params[:token])
		if user then
			return true
		else
			return false
		end
	end

	def view
		begin
			id = params[:id]
			@user = User.find(id)
			render json: [
					'status' => 200,
					'msg' => 'Ok',
					'data' => @user
			]
		rescue ActiveRecord::RecordNotFound => e
			render json: [
					'status' => 404,
					'msg' => 'User not found'
			]
		end
	end
end
