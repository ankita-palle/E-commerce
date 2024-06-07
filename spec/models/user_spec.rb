# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:orders) }
    it { should have_one(:cart) }
  end

  describe User do
    it { is_expected.to callback(:initialize_cart).after(:create) }
  end
end
