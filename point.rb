class Point 
  attr_reader :x, :y, :z, :acceptable
  
  def initialize(x, y, z, acceptable) 
    @x = x
    @y = y
    @z = z
    @acceptable = acceptable
  end

  def to_s
    "#{@x} #{@y} #{@z}: #{@acceptable}"
  end
end
