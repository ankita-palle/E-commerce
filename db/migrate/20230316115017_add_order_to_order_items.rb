# frozen_string_literal: true

class AddOrderToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :order, null: false, foreign_key: true
    add_reference :order_items, :cart_item, null: false, foreign_key: true
  end
end
