class Library
    attr_accessor :authors, :books, :readers, :orders

    def initialize
        @authors=[]
        @books=[]
        @readers=[]
        @orders=[]
    end

    def add(entity)
        puts entity.class
        @books << entity if entity.class==Book
        @authors << entity if entity.class==Author
        @readers << entity if entity.class==Reader
        @orders << entity if entity.class==Order
    end

    def to_h
        {books: books, authors: authors, readers: readers, orders: orders  }
    end

    def save
        open("Class/library.yaml",'w'){|f| YAML.dump(self.to_h, f)}
    end

    def load
        if File.exist?("Class/library.yaml")
            h=open("Class/library.yaml",'r'){|f| YAML.load(f)}
            @authors=h[:authors]
            @books=h[:books]
            @readers=h[:readers]
            @orders=h[:orders]
        else
            puts "File not found"
        end
                   
    end

    
    def get_info
        begin
            info="Библиотека: книга - #{@books[books.length-1].title}, автор - #{@authors[authors.length-1].name}, заказ - #{@orders[orders.size-1].reader.name}"
        rescue NoMethodError
            puts "error: no elements"
        end
    end
end