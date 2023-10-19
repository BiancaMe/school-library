require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.capitalize
  end
end
