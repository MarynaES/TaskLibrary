class Order
    attr_accessor :date
    attr_reader :book, :reader

    def initialize(date, book, reader)
        @date=date
        @book=book
        @reader=reader
    end

    def get_info
        @info="Заказ - книга: #{@book.title}, автор: #{@book.author.name}, читатель: #{@reader.name}, дата: #{@date.strftime("%d/%m/%Y")}"
    end

end