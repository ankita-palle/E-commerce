# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'association' do
    it { should belong_to(:order) }
    it { should belong_to(:cart_item) }
  end
end
