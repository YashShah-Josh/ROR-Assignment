class Instrument
  def play
    puts "Playing music..."
  end
end

class Guitar < Instrument
  def strum
    puts "Strumming the guitar..."
  end
end

my_guitar = Guitar.new
my_guitar.play  # Inherited method from Instrument
my_guitar.strum # Method from Guitar class
