# frozen_string_literal: true

class AddAttributesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name, :string
    add_column :products, :price, :integer
    add_column :products, :description, :text
    add_column :products, :status, :integer
  end
end
