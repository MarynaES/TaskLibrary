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
    open('Class/library.yaml', 'w'){ |f| YAML.dump(to_h, f) }
  end

  def load
    if File.exist?('Class/library.yaml')
      h = open('Class/library.yaml', 'r'){ |f| YAML.load(f) }
      @authors = h[:authors]
      @books = h[:books]
      @readers = h[:readers]
      @orders = h[:orders]
    else
      puts 'File not found'
    end
  end

  def popular_book
    if @orders.size.positive?
      counter = Array.new(@books.size){ 0 }
      @orders.each{ |val| counter[@books.index(val.book)] += 1 }
      puts @books[counter.index(counter.max)].title
    else
      puts 'No order information.'
    end
  end

  def active_reader(amount)
    if @orders.size.positive?
        counter = Array.new(@readers.size){ 0 }
        @orders.each{ |val| counter[@readers.index(val.reader)] += 1 }
        #for i in (1..k)
        amount.times do
          index_max = counter.index(counter.max)
          puts @readers[index_max].name + ", orders -  " + counter[index_max].to_s
          counter[index_max] = 0
        end
    else
        puts 'No order information.'
    end
  end

  def readers_popular_books(amount)
    if @orders.size.positive?
      counter = Array.new(@books.size){ 0 }
      @orders.each{ |val| counter[@books.index(val.book)] += 1 }
      popular_books=[]
      amount.times do
        index_max = counter.index(counter.max)
        popular_books <<  @books[index_max]
        counter[index_max] = 0
      end
      readers_books=[]
      @orders.each do |val|
        if popular_books.include?(val.book)
          readers_books << val.reader if (not readers_books.include?(val.reader))
        end  
      end 
      puts 'Most popular books:'
      popular_books.each{ |val| puts val.to_s } 
      puts 'Readers of popular books:'
      readers_books.each{ |val| puts val.to_s }
    else
      puts 'No order information.'
    end
  end
        
  def put_info_entity
    puts 'Press 1, if you want to see authors, 2 - books, 3 - readers, 4 - orders'
    choose = gets.chomp
    case choose
    when '1'
        @authors.each{ |val| puts val.to_s }
        puts "Total #{@authors.size} authors"
    when '2'
        @books.each{ |val| puts val.to_s } 
        puts "Total #{@books.size} books"
    when '3'
        @readers.each{ |val| puts val.to_s } 
        puts "Total #{@readers.size} readers"
    when '4'
        @orders.each{ |val| puts val.to_s } 
        puts "Total #{@orders.size} orders"
    else
        puts 'Selection error!'
    end
  end
end