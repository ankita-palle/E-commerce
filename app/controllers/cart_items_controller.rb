# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def create
    cart_item = @cart.cart_items.where(product_id: params[:product_id])&.first
    product = Product.find(params[:product_id])
    item = cart_item || @cart.cart_items.new(product_id: params[:product_id])
    quantity = item.quantity += 1
    item.total = product.price * quantity
    if item.save
      redirect_to carts_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
