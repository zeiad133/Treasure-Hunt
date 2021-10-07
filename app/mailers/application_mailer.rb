# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ruby@support.com'
  layout 'mailer'
end
