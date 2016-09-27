class SessionsController < ApplicationController
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def new
    end
    def create
        if @user = User.find_by(user_params)
            session[:session_token] = @user.session_token
            redirect_to movies_path
        else
            flash[:notice] = "invalid user-id/email combination."
            redirect_to login_path
        end
    end
    def destroy
        session[:session_token] = nil
        redirect_to movies_path
    end
end