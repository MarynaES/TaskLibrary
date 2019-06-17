class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    self.load
  end

  def add(entity)
    @books << entity if entity.class == Book
    @authors << entity if entity.class == Author
    @readers << entity if entity.class == Reader
    @orders << entity if entity.class == Order
  end

  def to_h
    { books: books, authors: authors, readers: readers, orders: orders }
  end

  def save
    open('Class/library.yaml', 'w') { |f| YAML.dump(to_h, f) }
  end

  def load
    if File.exist?('Class/library.yaml')
      h = open('Class/library.yaml', 'r') { |f| YAML.load(f) }
      @authors = h[:authors]
      @books = h[:books]
      @readers = h[:readers]
      @orders = h[:orders]
    else
      puts 'File not found'
    end
  end

  def counter_books(amount)
    readable_books = []
    if @orders.size.positive?
      counter = Array.new(@books.size) { 0 }
      @orders.each { |val| counter[@books.index(val.book)] += 1 }
      amount.times do
        index_max = counter.index(counter.max)
        readable_books <<  @books[index_max]
        counter[index_max] = 0
      end
    else
      puts 'No order information.'
    end
    return readable_books
  end

  def popular_books(amount = 1)
    a_books = counter_books(amount)
    if a_books.empty?
      puts 'No information about orders of books.'
    else
      put_info('Most popular books:', a_books)
    end
  end

  def active_readers(amount = 1)
    if @orders.size.positive?
      counter = Array.new(@readers.size) { 0 }
      @orders.each { |val| counter[@readers.index(val.reader)] += 1 }
      puts 'Most active readers: '
      amount.times do
        index_max = counter.index(counter.max)
        puts @readers[index_max].name + ', orders -  ' + counter[index_max].to_s
        counter[index_max] = 0
      end
    else
      puts 'No order information.'
    end
  end

  def books_readers(amount = 1)
    a_books = counter_books(amount)
    a_readers = []
    @orders.each do |val|
      if a_books.include?(val.book)
        a_readers << val.reader if !a_readers.include?(val.reader)
      end
    end
    if a_books.empty?
      puts 'No information about orders of books.'
    else
      put_info('Most popular books:', a_books)
      put_info('Readers of popular books:', a_readers)
      puts "#{amount} most popular books read #{a_readers.size} readers"
    end
  end

  def put_info(comment, array_entity)
    puts comment
    array_entity.each { |val| puts val.to_s }
  end

  def info_entity
    puts 'Press 1, if you want to see authors, 2 - books, 3 - readers, 4 - orders, other - continue'
    choose = gets.chomp
    case choose
    when '1'
      @authors.each { |val| puts val.to_s }
      puts "Total #{@authors.size} authors"
    when '2'
      @books.each { |val| puts val.to_s }
      puts "Total #{@books.size} books"
    when '3'
      @readers.each { |val| puts val.to_s }
      puts "Total #{@readers.size} readers"
    when '4'
      @orders.each { |val| puts val.to_s }
      puts "Total #{@orders.size} orders"
    else
      puts 'Selection error!'
    end
  end
end
