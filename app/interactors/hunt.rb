# frozen_string_literal: true

class Hunt
  include Interactor
  delegate :current_location, :user, :treasure, :fail!, to: :context

  def call
    fail!(errors: "You have already found the treasure") if user.treasure_found?

    validate_location
    context.distance = (treasure.distance_from(current_location) * 1000).to_i
    treasure_found if context.distance <= 5

  end

  private

  def treasure_found
    context.message = "Congratulations An email will be sent to you with the treasure details"
    user.update(treasure_found: true)
    treasure.number_of_winners +=1
    treasure.save
    UserMailer.send_treasure_details(user, treasure).deliver_now
  end

  def validate_location
    fail!(errors: "please enter a valid location") if current_location.blank?
    fail!(errors: "Location must consist of lat & lng only") unless current_location.length == 2
    fail!(errors:  "lat must be decimal") unless is_number?(current_location.first)
    fail!(errors:  "lng must be decimal") unless is_number?(current_location.last)
  end

  def is_number?(string)
    true if Float(string) rescue false
  end
end
