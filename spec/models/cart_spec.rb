# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:cart_items) }
  end
end
