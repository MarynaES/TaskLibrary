class Author
  attr_reader :name, :biography, :year_birth

  def initialize(name_var, biography, year_var)
    self.name = name_var
    @biography = biography
    self.year_birth = year_var
  end

  def name=(name_var)
    if name_var.length > 16 || name_var.length < 3
      raise name_var + ' - invalid author name!'
    end

    @name = name_var
  end

  def year_birth=(year_var)
    if year_var > Time.new.year - 10
      raise year_var.to_s + ' - invalid year of birth!'
    end

    @year_birth = year_var
  end

  def to_s
    "Author - name: #{@name}, year of birth: #{@year_birth}, biography: #{@biography}"
  end
end
