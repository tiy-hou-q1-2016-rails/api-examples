class Api::OrdersController < ApplicationController

  before_action :doorkeeper_authorize!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by id: params[:id]
  end
end
