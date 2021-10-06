class AdminController < ApplicationController 
  before_action :authorize, except: [:new, :create]
  before_action :set_admin, only: %i[show edit update destroy]

  def new; end

  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin.password_digest == params[:password]
      session[:admin_id] = @admin.id
      redirect_to '/', notice: 'You have successfully signed in'
    else 
      flash[:alert] = 'There was a problem with your username or password' 
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil 
    redirect_to '/admin/new', notice: 'You have successfully logged out'
  end

  private

  def params_admin
    params.admit(:admin).permit(:email,:password)
  end

  def set_admin
    @admin = Admin.first
  end
end
