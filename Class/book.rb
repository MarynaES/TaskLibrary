class Book
  attr_reader :title, :author, :description

  def initialize(title, author, description = '')
    @title = title
    @author = author
    @description = description
  end

  def to_s
    "Book - title: #{@title}, author: #{@author.name}, description: #{@description}"
  end
end
