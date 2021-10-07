# frozen_string_literal: true

require 'active_support/concern'
module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    include ActiveSupport::Rescuable
    rescue_from ActionController::ParameterMissing,
      with: :missing_param_response
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    rescue_from ArgumentError, with: :invalid_date_param
  end

  def missing_param_response(message)
    render json: { error: message }, status: :bad_request
  end

  def invalid_date_param(message)
    render json: { error: message }, status: :bad_request
  end

  def record_not_found_response
    head :not_found
  end
end
