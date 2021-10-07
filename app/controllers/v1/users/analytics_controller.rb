# frozen_string_literal: true

class V1::Users::AnalyticsController < V1::Users::BaseController

  def index
    requests = Request.includes(:user)
    requests = requests.by_created_at_since(params[:start_time]) if params[:start_time].present?
    requests = requests.by_created_at_until(params[:end_time]) if params[:end_time].present?
    requests = requests.by_radius(params[:radius]) if params[:radius].present?

    paginate(collection: requests)
  end
end
