class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #render plain: "You have entered the correct password !!"
      session[:current_user_id] = user.id
      redirect_to "/"
    elsif !user && !(params[:email].empty?)
      flash[:error] = " User does not exist!!!"
      redirect_to new_sessions_path
    elsif user && !user.authenticate(params[:password])
      flash[:error] = "password is invalid!!!"
      redirect_to new_sessions_path
    else
      #render plain: "Incorrect password!!"
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end
  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
