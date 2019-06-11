class Library
    attr_accessor :authors, :books, :readers, :orders

    def initialize
        @authors=[]
        @books=[]
        @readers=[]
        @orders=[]
        self.load
    end

    def add(entity)
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

    def popular_book
        if @orders.size>0
            counter=Array.new(@books.size){|val| 0}
            @orders.each{|val| counter[@books.index(val.book)]+=1}
            puts @books[counter.index(counter.max)].title
        else
            puts "Нет информации о заказах."
        end
    end

    def active_reader(k)
        if @orders.size>0
            counter=Array.new(@readers.size){|val| 0}
            @orders.each{|val| counter[@readers.index(val.reader)]+=1}
            for i in (1..k)
                index_max=counter.index(counter.max)
                puts @readers[index_max].name + ", заказов -  " + counter[index_max].to_s
                counter[index_max]=0
            end
        else
            puts "Нет информации о заказах."
        end
    end
        
    def get_info_entity
        puts "Press 1, if you want to see authors, 2 - books, 3 - readers, 4 - orders"
        choose=gets.chomp
        case choose
        when "1" 
            @authors.each{|val| puts val.get_info}
            puts "Всего #{@authors.size} авторов"
        when "2" 
            @books.each{|val| puts val.get_info} 
            puts "Всего #{@books.size} книг"
        when "3" 
            @readers.each{|val| puts val.get_info} 
            puts "Всего #{@readers.size} читателей"
        when "4" 
            @orders.each{|val| puts val.get_info} 
            puts "Всего #{@orders.size} заказов"
        else 
            puts "Ошибка выбора"
        end
    end
end