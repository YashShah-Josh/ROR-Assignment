class Instrument
  def play
    puts "Playing music..."
  end
end

class Guitar < Instrument
  def play
    super  # Calls the parent's play method
    puts "Strumming the guitar..."
  end
end

my_guitar = Guitar.new
my_guitar.play
