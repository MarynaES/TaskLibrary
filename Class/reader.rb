# класс Читатель
class Reader
  attr_accessor :name, :age, :address, :phone, :email

  def initialize(name, age_var, address, phone_var, email)
    @name = name
    self.age = age_var
    @address = address
    self.phone = phone_var
    @email = email
  end

  def age=(age_var)
    if age_var < 18
      raise age_var.to_s + " - invalid age!"
    end
    @age = age_var 
  end

  def phone=(phone_var)
    if (phone_var =~ /^[+]/) == nil
      raise phone_var + " - invalid phone (first character must be +)"
    end
    @phone = phone_var
    #@phone = phone_var unless (phone_var =~ /^[+]/).nil?
  end

  def to_s
    "Reader - name: #{@name}, age: #{@age}, address: #{@address}, phone: #{@phone}"
  end
end
