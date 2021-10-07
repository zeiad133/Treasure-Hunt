# frozen_string_literal: true

class V1::Admin::BaseController < ApplicationController
  include ActionController::MimeResponds
  before_action :authenticate_admin!
  before_action :update_auth_header
end
