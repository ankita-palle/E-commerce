# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.decimal :total, default: 0, nil: false
      t.integer :quantity, default: 0, nil: false
      t.timestamps
    end
  end
end
