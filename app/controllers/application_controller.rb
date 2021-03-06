class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authorize
    redirect_to '/admin/new', alert: 'Please Log in to view admin page' unless current_admin
  end
end
