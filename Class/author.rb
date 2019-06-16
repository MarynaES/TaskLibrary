class Author
  attr_accessor :name, :biography, :year_birth

  def initialize (name_var, biography, year_var)
    self.name = name_var  
    @biography = biography
    self.year_birth = year_var
  end

  def name=(name_var)
    if name_var.length > 16 or name_var.length < 3
      raise name_var + " - invalid author name!"
    end
    @name = name_var 
    #@name = name_var unless name_var.length > 16 or name_var.length < 3
  end

  def year_birth=(year_var)
    if year_var > Time.new.year - 10
      raise year_var.to_s + " - invalid year of birth!"
    end  
    @year_birth = year_var
  #  @year_birth = year_var unless year_var > Time.new.year - 10
  end

  def to_s
    "Author - name: #{@name}, year of birth: #{@year_birth}, biography: #{@biography}"
  end
end
    