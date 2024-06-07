# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'association' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end
end
