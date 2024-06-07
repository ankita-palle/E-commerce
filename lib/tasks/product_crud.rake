# frozen_string_literal: true

namespace :product_crud do
  desc 'Desplay products'
  task product_create: :environment do
    Product.create(name: 'charger', price: 300)
  end
end
