require_relative "point"

class MinMaxFinder
  MIN_VALUE = -100000
  MAX_VALUE = 100000

  attr_reader :x_max, :y_max, :z_max,
              :x_min, :y_min, :z_min

  def initialize
    @x_max = MIN_VALUE
    @y_max = MIN_VALUE
    @z_max = MIN_VALUE

    @x_min = MAX_VALUE
    @y_min = MAX_VALUE
    @z_min = MAX_VALUE
  end
  
  def update_min_max(point) 
    update_max(point)
    update_min(point)
  end

  def update_max(point)
    return if !point.acceptable
    @x_max = point.x if point.x > @x_max
    @y_max = point.y if point.y > @y_max
    @z_max = point.z if point.z > @z_max
  end

  def update_min(point)
    return if !point.acceptable
    @x_min = point.x if point.x < @x_min
    @y_min = point.y if point.y < @y_min
    @z_min = point.z if point.z < @z_min
  end
  
  def max_point
    Point.new(@x_max, @y_max, @z_max, true)
  end

  def min_point
    Point.new(@x_min, @y_min, @z_min, true)
  end
end
