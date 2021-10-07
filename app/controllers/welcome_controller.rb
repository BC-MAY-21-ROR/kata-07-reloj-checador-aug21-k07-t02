class WelcomeController < ApplicationController
  before_action :authorize, except: [:index]
  def index; end
end
