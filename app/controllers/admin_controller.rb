class AdminController < ApplicationController 
  before_action :authorize, except: [:new, :create]
  before_action :set_admin, only: %i[show edit update destroy]

  def new
  end

  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin.present? && @admin.authenticate(params[:password])
      p @admin
      session[:admin_id] = @admin.id
      redirect_to users_path, notice: 'You have successfully signed in'

    else 
      flash[:alert] = 'There was a problem with your username or password' 
      render :new
    end
  end

  def destroy
    session[:current_admin_id] = nil 
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
