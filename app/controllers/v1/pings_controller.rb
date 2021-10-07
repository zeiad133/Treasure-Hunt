# frozen_string_literal: true

class V1::PingsController < V1::Users::BaseController
  skip_before_action :fetch_user
  def index
    head(:ok)
  end
end
