require_relative 'Class/book.rb'
require_relative 'Class/author.rb'
require_relative 'Class/reader.rb'
require_relative 'Class/order.rb'

a=Author.new('Lev Tolstoy',"",1828)
puts a.get_info
 
book1=Book.new('Woyna i mir',a)
book1.description="aaaaa"
puts book1.title
puts book1.get_info

r=Reader.new('Иванов А.П.', 22, "г.Днепр, ул.Светлая, 15", "+38 22233344", "asd@i.ua")
puts r.get_info

order1=Order.new(Time.new,book1, r)
puts order1.get_info
