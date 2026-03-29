class Instrument
  def initialize(brand, price)
    @brand = brand
    @price = price
  end

  def details
    puts "Brand: #{@brand}, Price: #{@price}"
  end
end

class Guitar < Instrument
  def initialize(brand, price, type)
    super(brand, price)  # Calls Instrument's constructor
    @type = type
  end

  def details
    super  # Calls the parent's details method
    puts "Type: #{@type}"
  end
end

guitar = Guitar.new("Fender", 1500, "Electric")
guitar.details
