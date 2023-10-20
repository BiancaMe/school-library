require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def menu
    puts '
  ███████████████████████████████████████████████████████████████████████████
  █─▄▄▄▄█─▄▄▄─█─█─█─▄▄─█─▄▄─█▄─▄█████▄─▄███▄─▄█▄─▄─▀█▄─▄▄▀██▀▄─██▄─▄▄▀█▄─█─▄█
  █▄▄▄▄─█─███▀█─▄─█─██─█─██─██─██▀████─██▀██─███─▄─▀██─▄─▄██─▀─███─▄─▄██▄─▄██
  ▀▄▄▄▄▄▀▄▄▄▄▄▀▄▀▄▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▄▀▀▀▄▄▄▄▄▀▄▄▄▀▄▄▄▄▀▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▀▄▄▄▀▀'
    puts ''
    puts 'Please choose an option by enterin a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def choose_option(option)
    case option
    when 1 then @app.list_books
    when 2 then @app.list_people
    when 3 then new_person
    when 4 then new_book
    when 5 then new_rental
    when 6 then show_rental
    else
      'The option is not valid'
    end
  end

  def new_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Specialization:'
    specialization = gets.chomp
    puts 'Name:'
    name = gets.chomp
    @app.create_teacher(age, specialization, name)
  end

  def new_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Classroom: '
    classroom = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [y/n]'
    permission = gets.chomp
    @app.create_student(age, classroom, name, permission)
  end

  def new_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1 then new_student
    when 2 then new_teacher
    end
  end

  def new_book
    puts 'Write the title of the new book:'
    title = gets.chomp
    puts 'Write the author of the new book:'
    author = gets.chomp
    @app.create_book(title, author)
  end

  def select_book
    puts 'Select a book from the following list by number: '
    @app.books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author #{book.author}"
    end
    book = gets.chomp.to_i
    @app.people[book]
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @app.people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    @app.people[person]
  end

  def new_rental
    if @app.books.empty? || @app.people.empty?
      puts 'There are not people or books to create a rental'
    else
      book = select_book
      person = select_person
      puts 'Date: '
      date = gets.chomp
      create_rental(date, book, person)
    end
  end

  def show_rental
    puts 'ID of person: '
    id = gets.chomp.to_i
    specific_rental(id)
  end

  def main_menu
    menu
    option = gets.chomp.to_i
    if option >= 1 && option < 8
      choose_option(option)
      menu unless option == 7
    else
      puts 'The option is not valid'
    end
  end
end

main = Main.new
main.main_menu
