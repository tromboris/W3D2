class Card 
  
  attr_reader :face_value, :face_flag

  def initialize(symbol)
    @face_value = symbol
    @face_flag = false # true = face up, false = face down
  end

  def display_information
    return @face_value if @face_flag
  end

  def hide
    @face_flag = false
  end

  def reveal
    @face_flag = true
  end

  def to_s
    @face_value.to_s
  end

  def ==(card_2)
    return false if card_2 == nil
    @face_value == card_2.face_value
  end
end