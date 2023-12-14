class SessionsController < ApplicationController
  # new
  def new; end

  # new
  def create
    user = User.find_by(email: (params[:session][:email]).downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to(user)
    else
      flash.now[:alert] = 'Incorrect credentials'
      render(:new, status: :unprocessable_entity)
    end
  end

  # new
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(root_path)
  end
end
