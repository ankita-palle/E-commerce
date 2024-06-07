# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
  end
end
