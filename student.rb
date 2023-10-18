require_relative 'person'
class Student < Person
    def initialize(name = "Unknown", age, permission = true, classroom)
        super(name, age, permission)
        @classroom = class
    end

    def play_hooky
      puts  '¯\(ツ)/¯'
    end
end