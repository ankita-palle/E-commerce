# frozen_string_literal: true

require 'rails_helper'
# include Warden::Test::Helpers

RSpec.describe ProductsController, type: :controller do
  before(:each) do
    user = User.create(email: Faker::Internet.email, password: 'admin@123')
    user.add_role :admin
    sign_in user
  end

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    it 'show data' do
      show_product = Product.create(name: 'cover', price: 200)
      get :show, params: { id: show_product.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    it 'creates a new product' do
      post :create, params: { product: { name: 'cover', price: 200 } }
      expect(response).to have_http_status(302)
    end
  end

  describe 'PATCH update' do
    let(:product) { FactoryBot.create(:product) }
    it 'update data' do
      product.update(name: 'Like a Rolling Stone - Remastered', price: 436)
      expect(Product.find_by_name('Like a Rolling Stone - Remastered')).to eq(product)
    end
  end

  describe 'DELETE destroy' do
    it 'delete data' do
      delete_product = Product.create(name: 'cover', price: 200)
      delete :destroy, params: { id: delete_product.id }
      expect(response).to have_http_status(303)
    end
  end
end
