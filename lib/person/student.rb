require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', permission: true)
    super(age, name: name, parent_permission: permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
