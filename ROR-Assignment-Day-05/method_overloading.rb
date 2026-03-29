class Instrument
  def play
    puts "Playing music..."
  end
end

class Guitar < Instrument
  def play
    puts "Playing music with Guitar..."
  end
end

my_guitar = Guitar.new
my_guitar.play  # Inherited method from Instrument
