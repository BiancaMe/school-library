require_relative 'person'
class Teacher < Person
    def initialize(name = "Unknown", age, permission = true, specialization)
        super(name, age, permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end

    def play_hooky
      puts  '¯\(ツ)/¯'
    end
end