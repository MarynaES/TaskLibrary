require_relative 'Class/book.rb'
require_relative 'Class/author.rb'
require_relative 'Class/reader.rb'
require_relative 'Class/order.rb'
require_relative 'Class/library.rb'
require "yaml"

l=Library.new
l.popular_book
l.active_reader(2)

#  l.add(Author.new('Nesterova N.',"",1958))
#  l.add(Author.new('Ustinova T.',"",1962))
#  l.add(Author.new('Shevchenko T.',"",1814))
#  l.add(Author.new('Pushkin A.',"",1799))
#  l.add(Author.new('Tolstoy L.',"",1828))

# l.save

# # puts l.get_info_authors

# # a=Author.new('Lev Tolstoy',"",1828)
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

#  l.add(Reader.new('Иванов А.П.', 22, "г.Днепр, ул.Светлая, 15", "+38 22233344", "asd@i.ua"))
#  l.add(Reader.new('Петрова Н.О.', 34, "г.Днепр, ул.Тихвинская, 3", "+38 5675433", "sss@i.ua"))
#  l.add(Reader.new('Остапова И.М.', 50, "г.Днепр, ул.Виноградная, 65", "+38 82736456", "rfbgh@i.ua"))
#  l.add(Reader.new('Сидорчук Г.П.', 43, "г.Днепр, ул.Янтарная, 88/32", "+38 29487372", "jdrty@i.ua"))

# l.add(Order.new(Time.new,l.books[4],l.readers[2]))
#  l.add(Order.new(Time.new-10,l.books[2],l.readers[0]))
#  l.add(Order.new(Time.new-20,l.books[4],l.readers[1]))
#  l.add(Order.new(Time.new-5,l.books[4],l.readers[0]))
# l.add(Order.new(Time.new-30,l.books[1],l.readers[1]))
# l.add(Order.new(Time.new-11,l.books[3],l.readers[3]))
# l.add(Order.new(Time.new-10000,l.books[1],l.readers[3]))
# l.add(Order.new(Time.new-1500,l.books[2],l.readers[3]))
# l.add(Order.new(Time.new-20000,l.books[1],l.readers[3]))


# order1=Order.new(Time.new,book1, r)
# puts order1.get_info

#l.save
puts l.get_info_entity

