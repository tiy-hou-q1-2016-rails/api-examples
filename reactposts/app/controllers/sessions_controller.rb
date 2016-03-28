class SessionsController < ApplicationController
  def new
  end

  def create

    email = params[:email]
    password = params[:password]
    @current_user = User.find_by email: email
    if @current_user && @current_user.authenticate(password)
      #sign them in
      session[:user_id] = @current_user.id
      #send them along their way
      redirect_to root_path
    else
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end
end
