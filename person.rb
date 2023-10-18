class
    def initialize(name = "Unknown", age, permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = permission
    end

    attr_reader :id

    attr_accessor :name
    attr_accessor :age

    private
    def of_age?
        @age >= 18
    end

    def can_use_services?
        of_age || @parent_permission
    end
end