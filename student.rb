require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', permission: true)
    super(age, name, permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
