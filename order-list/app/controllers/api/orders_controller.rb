class Api::OrdersController < ApplicationController

  before_action :doorkeeper_authorize!
  protect_from_forgery with: :null_session


  def index
    @orders = Order.all

    # add pagination with kaminari
    # add date filtering
    # add sorting by date
  end

  def show
    @order = Order.find_by id: params[:id]
  end

  def create
    @order = Order.new params.require(:order).permit(:product_name, :order_date, :amount_in_cents)
    if @order.save
      render :show
    else
      render json: @order.errors, status: 422
    end
  end

  def update
    @order = Order.find_by id: params[:id]
    if @order.update params.require(:order).permit(:product_name, :order_date, :amount_in_cents)
      render :show
    else
      render json: @order.errors, status: 422
    end
  end

  def delete
    @order = Order.find_by id: params[:id]
    @order.destroy
    head :ok
  end
end
