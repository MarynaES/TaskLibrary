class Book
    attr_accessor :title, :description
    attr_reader :author

    def initialize(title, author, description="")
        @title=title
        @author=author
        @description=description
    end

    def get_info
        @info="Книга - название: #{@title}, автор: #{@author.name}, описание: #{@description}"
    end

end
