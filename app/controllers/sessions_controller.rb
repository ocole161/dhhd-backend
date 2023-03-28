class SessionsController < ApplicationController
    
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            puts user
            puts user.id
            session[:user_id] = user.id
            puts session[:user_id]
            render json: user, status: :ok
        else
            render json: {error: "Invalid Username and/or Password"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end