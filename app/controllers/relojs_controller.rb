class RelojsController < ApplicationController
  before_action :set_reloj, only: [:show, :update, :destroy]

  # GET /relojs
  def index
    @relojs = Reloj.all

    render json: @relojs
  end

  # GET /relojs/1
  def show
    render json: @reloj
  end

  # POST /relojs
  def create
    @reloj = Reloj.new(reloj_params)

    if @reloj.save
      render json: @reloj, status: :created, location: @reloj
    else
      render json: @reloj.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relojs/1
  def update
    if @reloj.update(reloj_params)
      render json: @reloj
    else
      render json: @reloj.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relojs/1
  def destroy
    @reloj.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reloj
      @reloj = Reloj.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reloj_params
      params.require(:reloj).permit(:name)
    end
end
