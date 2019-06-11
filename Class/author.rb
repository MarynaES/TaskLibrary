class Author
    attr_accessor :name, :biography, :year_birth

    def initialize (nameVar, biography, yearVar)
        self.name=nameVar  
        @biography=biography
        self.year_birth=yearVar
    end

    def name=(nameVar)
        @name=nameVar unless nameVar.length > 16 or nameVar.length < 3
    end

    def year_birth=(yearVar)
        @year_birth=yearVar unless yearVar > Time.new.year-10
    end

    def get_info
        info="Автор - фамилия: #{@name}, год рожд.: #{@year_birth}, биография: #{@biography}"
    end
end
    