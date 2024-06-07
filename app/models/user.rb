# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart, dependent: :destroy

  after_create :initialize_cart, :call_mailer

  after_initialize :set_default_role, if: :new_record?

  private

  def initialize_cart
    InitializeCartJob.perform_now(id)
  end

  def call_mailer
    CrudNotificationMailer.create_notification(self).deliver_now
  end

  def set_default_role
    add_role(:customer)
  end
end
