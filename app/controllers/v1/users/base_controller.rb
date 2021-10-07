# frozen_string_literal: true

class V1::Users::BaseController < ApplicationController
  include ActionController::MimeResponds
  before_action :authenticate_user!
  before_action :update_auth_header

end
