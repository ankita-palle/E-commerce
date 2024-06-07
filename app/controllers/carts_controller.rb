# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = current_user.cart.cart_items
  end
end
