# frozen_string_literal: true

class ChangeDefaultToCartItems < ActiveRecord::Migration[7.0]
  def up
    change_column :cart_items, :quantity, :integer, default: 0
    change_column :cart_items, :total, :integer, deafult: 0
  end

  def down
    change_column :cart_items, :quantity, :integer, default: nil
    change_column :cart_items, :total, :integer, default: nil
  end
end
