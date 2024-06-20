# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, :set_cart_items

  def index
    @orders = current_user.orders
    @all_orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    order = Order.create(user_id: current_user.id)
    if @cart_item.where(product_id: params[:product_id]).blank?
      item = OrderItem.new(cart_item_id: @cart_item.last.id,order_id: order.id)
      quantity = item.quantity += 1
      item.total = @cart_item.last.product.price * quantity
    else
      item = @cart_item.find(params[:id])
      order_item = order.order_items.where(cart_item_id: params[:id])&.first
      item = order_item || OrderItem.new(total: item.total, quantity: item.quantity, cart_item_id: item.id,
                                       order_id: order.id)
    end
    quantity = item.quantity += 1
    order.total = item.total
    if order.save
      redirect_to orders_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy

    redirect_to orders_path, status: :see_other
  end

  private

  def set_cart_items
    @cart_item = current_user.cart.cart_items
  end
end
