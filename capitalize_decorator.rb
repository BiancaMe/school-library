require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.caitalize
  end
end
