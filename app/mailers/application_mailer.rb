# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'anpalle@bestpeers.com'
  layout 'mailer'
end
