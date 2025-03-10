class Instrument
  def play
    puts "Playing a musical instrument..."
  end
end

class StringInstrument < Instrument
  def has_strings?
    puts "Yes, I have strings."
  end
end

class Guitar < StringInstrument
  def strum
    puts "Strumming the guitar..."
  end
end

my_guitar = Guitar.new
my_guitar.play        # Inherited from Instrument
my_guitar.has_strings? # Inherited from StringInstrument
my_guitar.strum       # Defined in Guitar class
