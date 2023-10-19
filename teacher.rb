require 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', permission: true)
    super(name, age, permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
