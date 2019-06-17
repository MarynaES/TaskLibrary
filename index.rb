require_relative 'Class/book.rb'
require_relative 'Class/author.rb'
require_relative 'Class/reader.rb'
require_relative 'Class/order.rb'
require_relative 'Class/library.rb'
require 'yaml'

l = Library.new
puts l.info_entity

l.popular_books(2)
puts ''
l.active_readers(3)
puts ''
l.books_readers(2)

puts 'Add author? Y - Yes. N (or other)- No.'
if %w[y Y].include?(gets.chomp) 
  puts 'Enter name'
  a = gets.chomp
  puts 'Enter year of birth'
  b = gets.chomp
  puts 'Enter biography'
  c = gets.chomp
  l.add(Author.new(a, c, b.to_i))
end

puts 'Add book? Y - Yes. N (or other)- No.'
if %w[y Y].include?(gets.chomp) 
  puts 'Enter title'
  a = gets.chomp
  puts 'Enter number of author at list'
  b = gets.chomp
  puts 'Enter description'
  c = gets.chomp
  l.add(Book.new(a, l.authors[b.to_i], c))
end

puts 'Add reader? Y - Yes. N (or other)- No.'
if %w[y Y].include?(gets.chomp) 
  puts 'Enter name'
  a = gets.chomp
  puts 'Enter age'
  b = gets.chomp
  puts 'Enter address'
  c = gets.chomp
  puts 'Enter phone'
  d = gets.chomp
  puts 'Enter e-mail'
  s = gets.chomp
  l.add(Reader.new(a, b.to_i, c, d, s))
end

puts 'Add order? Y - Yes. N (or other)- No.'
if %w[y Y].include?(gets.chomp) 
  puts 'Enter number of book at list'
  a = gets.chomp
  puts 'Enter number of reader at list'
  b = gets.chomp
  l.add(Order.new(Time.new, l.books[a.to_i], l.readers[b.to_i]))
end

#  l.add(Author.new('Nesterova N.',"",1958))
#  l.add(Author.new('Ustinova T.',"",1962))
#  l.add(Author.new('Shevchenko T.',"",1814))
#  l.add(Author.new('Pushkin A.',"",1799))
#  l.add(Author.new('Tolstoy L.',"",1828))
#  l.add(Author.new('Tols',"",2028))

#  a=Author.new('Lev Tolstoy',"",1828)
#  a=l.authors[0]
#  l.add(Book.new("Stat ognem",a))
#  l.add(Book.new("Sibiryaki",a))
#  l.add(Book.new("Fantazerka",a))
#  a=l.authors[3]
#  l.add(Book.new("Metel",a))
#  l.add(Book.new("Evgeniy Onegin",a))
#  l.add(Book.new("Barishnya-krestyanka",a))
#  l.add(Book.new("Dubrovskiy",a))
#  l.add(Book.new("Pikovaya dama",a))

#   l.add(Reader.new("Ivanov A.", 22, "Dnipro, Svetlaya str. 15",
#                    "+38 22233344", "asd@i.ua"))
#   l.add(Reader.new('Petrova N.', 34, "Dnipro, Tihvinskaya str. 3",
#                     "+38 5675433", "sss@i.ua"))
#   l.add(Reader.new('Ostapova I.', 50, "Dnipro, Vinogradnaya str. 65",
#                     "+38 82736456", "rfbgh@i.ua"))
#   l.add(Reader.new('Tretyak S.', 35, "Dnipro, Yantarnaya str. 88/24",
#                    "+381 3454372", "jdrty@i.ua"))
#   l.add(Reader.new('Afanasov A.', 46, "Dnipro, Ribinskaya str. 12/3",
#                    "+38050 5849385", "rteg@i.ua"))

# l.add(Order.new(Time.new,l.books[4],l.readers[2]))
# l.add(Order.new(Time.new-10,l.books[2],l.readers[0]))
# l.add(Order.new(Time.new-20,l.books[4],l.readers[1]))
# l.add(Order.new(Time.new-5,l.books[4],l.readers[0]))
# l.add(Order.new(Time.new-30,l.books[1],l.readers[1]))
# l.add(Order.new(Time.new-11,l.books[3],l.readers[3]))
# l.add(Order.new(Time.new-10000,l.books[1],l.readers[3]))
# l.add(Order.new(Time.new-1500,l.books[2],l.readers[3]))
# l.add(Order.new(Time.new-20000,l.books[1],l.readers[3]))

puts 'Save library? Y - Yes. N (or other)- No.'
l.save if %w[y Y].include?(gets.chomp)
