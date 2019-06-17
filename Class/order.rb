# class Order
class Order
  attr_reader :date, :book, :reader

  def initialize(date, book, reader)
    @date = date
    @book = book
    @reader = reader
  end

  def to_s
    "Order - book #{@book.title}, author: #{@book.author.name}, " \
    "reader: #{@reader.name}, date: #{@date.strftime('%d/%m/%Y')}"
  end
end
