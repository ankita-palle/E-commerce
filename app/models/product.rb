# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: true

  enum :status, %i[available out_of_stock], default: :available

  has_rich_text :description
  has_many_attached :images

  self.per_page = 3
end
