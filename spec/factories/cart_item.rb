# frozen_string_literal: true

FactoryBot.define do
  factory :cart_item do
    cart_id { 1 }
    product_id { 4 }
  end
end
