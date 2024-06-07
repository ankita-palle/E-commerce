# frozen_string_literal: true

class AddProductToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :product, null: false, foreign_key: true
  end
end
