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
      print 'There are no registered books'
    else
      print 'Books:'
      @books.each do |book|
        print "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      print 'There are no registered people'
    else
      print 'People:'
      @people.each do |person|
        print "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_student(age, classroom, name, option)
    permission = false
    permission = true if %w[y Y].include?(option)
    student = Student.new(age, classroom, name, permission)
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
    res = []
    @rentals.each do |rental|
      res << rental if rental.person.id == id
    end
    puts 'Rentals: '
    res.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.book.author}"
    end
  end
end
