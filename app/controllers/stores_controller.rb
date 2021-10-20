class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  def index
    @stores = Store.all
  end

  def show; end

  def new
    @store = Store.new
  end

  def edit; end

  def create
    @store = Store.new(store_params)
    return render :new, status: :unprocessable_entity unless @store.save

    redirect_to @store, notice: 'Store was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @store.update(store_params)

    redirect_to @store, notice: 'Store was successfully updated.'
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address)
  end
end
