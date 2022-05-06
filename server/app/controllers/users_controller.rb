class UsersController < ApplicationController
    def new
        @user=User.new
    end
    def create
        @user=User.new user_params
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_path, notice: "Logged in!"
        else
            render :new
        end
    end
    def update
        @user=current_user
        if params[:user][:password] == params[:user][:current_password]
            flash[:notice] = "Can not use current password"
            render :edit
        elsif @user&.authenticate(params[:user][:current_password])
            if @user.update user_params
                redirect_to edit_user_path, notice: "Profile successfully changed"
            else
                flash[:notice] = "Passwords did not match"
                render :edit
            end
        else
            flash[:notice] = "Current password incorrect"
            render :edit
        end
    end
    def edit
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
