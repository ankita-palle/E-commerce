# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before do
    @user = User.create(email: Faker::Internet.email, password: 'admin@123')
    @order = Order.create(total: 2435, user_id: @user.id)
    sign_in @user
  end

  describe 'GET index' do
    it 'returns a successfull response' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    it 'display the order' do
      get :show, params: { id: @order.id }
      expect(response).to have_http_status(200)
    end
  end

  # describe 'POST create' do
  #   let(:condition) { TRUE }
  #   it 'works for true' do
  #     post :create, params: { id: @order.id }
  #     expect(response).to have_http_status(302)
  #   end
  # end
end
