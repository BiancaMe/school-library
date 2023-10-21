require_relative 'lib/person/student'
require_relative 'lib/person/teacher'
require_relative 'lib/book'
require_relative 'lib/rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There are no registered books'
    else
      puts 'Books:'
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no registered people'
    else
      puts 'People:'
      @people.each do |person|
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_student(age, classroom, name, option)
    permission = false
    permission = true if %w[y Y].include?(option)
    student = Student.new(age, classroom, name: name, parent_permission: permission)
    @people << student
    puts 'Student created successfully'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def specific_rental(id)
    find = false
    @people.each do |person|
      next unless person.id == id

      find = true
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" if rental.person.id == id
      end
    end

    return if find

    puts 'Not found'
  end
end
