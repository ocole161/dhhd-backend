class UsersController < ApplicationController
    wrap_parameters format: []
    
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: session[:user_id])
        puts user
        render json: user, status: :ok
    end

    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :password, :user_type)
    end
end