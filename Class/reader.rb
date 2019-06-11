class Reader
    attr_accessor :name, :age, :address, :phone, :email

    def initialize(name, ageVar, address, phoneVar, email)
        @name=name
        self.age=ageVar
        @address=address
        self.phone=phoneVar
        @email=email
     end

    def age=(ageVar)
        if ageVar < 18
            raise ageVar.to_s + " - недопустимый возраст!"
        else
            @age=ageVar # unless ageVar < 18
        end
   
    end

    def phone=(phoneVar)
        @phone=phoneVar unless (phoneVar =~ /^[+]/) == nil
    end

    def get_info
        info="Читатель - фамилия: #{@name}, возраст: #{@age}, адрес: #{@address}, телефон: #{@phone}"
    end
end