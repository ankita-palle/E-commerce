# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let!(:user) { User.create(email: Faker::Internet.email, password: 'admin123') }
  let!(:product) { Product.create(name: 'mobile', price: 234) }
  let!(:cart_item) { CartItem.create(product_id: product.id, cart_id: user.cart.id) }
  before {sign_in user}

  describe 'GET show' do
    it 'show data' do
      get :show, params: { id: cart_item.id  }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST create" do
    it "create data" do
      post :create, params: { id: product.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE destroy" do
    it "delete data" do
      delete :destroy, params: {id: cart_item}
      expect(response).to have_http_status(302)
    end
  end
end
