# frozen_string_literal: true

class InitializeCartJob < ApplicationJob
  queue_as :default

  def perform(user)
    Cart.create(user_id: user)
  end
end
