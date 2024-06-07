# frozen_string_literal: true

class CrudNotificationMailer < ApplicationMailer
  def create_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: @object.email.to_s, subject: "A new #{@object.class} has been registerede"
  end
end
