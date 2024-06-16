# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :calculate_total

  private

  def calculate_total
    self.total = self.quantity * self.total
  end
end
