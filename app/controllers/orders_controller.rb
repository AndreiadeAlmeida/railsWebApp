class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.includes(:product)
    else
      @orders = current_user.orders.includes(:product)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
    @orders.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
