# frozen_string_literal: true

class V1::Users::PatternsController < V1::Users::BaseController
  before_action :set_pattern, only: %i(play)
  skip_before_action :fetch_user, only: [:create, :bulk_create]
  def index
    patterns = PlayedPattern.all
    paginate(collection: patterns)
  end

  def bulk_create
    return render(
      json: {error: "start and end must be integer"}, status: :unprocessable_entity
       ) if params[:start].class != Integer || params[:end].class != Integer

    codes = (params[:start]..params[:end]).to_a.each_with_object([]) { |code, memo| memo << {code: code} }
    Pattern.import codes, on_duplicate_key_ignore: true, validate: false
  end

  def show
    render(json: @player)
  end

  def create
    pattern = Pattern.new(code: params[:code])
    if pattern.save
      render(json: pattern, status: :created)
    else
      render(json: pattern.errors, status: :unprocessable_entity)
    end
  end

  def favorite
    @current_player.favorite_patterns = Pattern.where(code: params[:code])
    if @current_player.save
      render(json: @current_player.favorite_patterns, status: :created)
    else
      render(json: @current_player.errors, status: :unprocessable_entity)
    end
  end

  def play
    result = Patterns::Create.call(params: pattern_params, user_id: @current_player.id, pattern_id: @pattern.id)
    if result.success?
      render(json: result.pattern, status: :created)
    else
      render(json: result.errors, status: :unprocessable_entity)
    end
  end

  private

  def set_pattern
    @pattern = Pattern.find_by_code!(params[:code])
  end

  def pattern_params
    params.require(:played_pattern).permit(:code, :username, correct_words: [], wrong_words: [])
  end
end
