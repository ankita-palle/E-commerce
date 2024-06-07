# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
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
end
