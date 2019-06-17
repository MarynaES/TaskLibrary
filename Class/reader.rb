class Reader
  attr_reader :name, :age, :address, :phone, :email

  def initialize(name, age_var, address, phone_var, email)
    @name = name
    self.age = age_var
    @address = address
    self.phone = phone_var
    @email = email
  end

  def age=(age_var)
    raise age_var.to_s + ' - invalid age!' if age_var < 18
    @age = age_var
  end

  def phone=(phone_var)
    raise phone_var + ' - invalid phone (first character must be +)' if (phone_var =~ /^[+]/) == nil
    @phone = phone_var
  end

  def to_s
    "Reader - name: #{@name}, age: #{@age}, address: #{@address}, phone: #{@phone}"
  end
end
