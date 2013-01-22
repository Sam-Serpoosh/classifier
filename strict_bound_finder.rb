require_relative "point"
require_relative "point_data_reader"
require_relative "min_max_finder"

class Float 
  def to_b
    return false if self.eql?(-1)
    true
  end
end

class StrictBoundFinder
  def initialize(min_max_finder = MinMaxFinder.new, 
                 point_data_reader = PointDataReader.new("training_set"))
    @min_max_finder = min_max_finder 
    @point_data_reader = point_data_reader
  end

  def read_data_and_find_min_max
    all_points = @point_data_reader.read_points_data
    all_points.each { |point| @min_max_finder.update_min_max(point) }
  end

  def max_point
    @min_max_finder.max_point
  end

  def min_point
    @min_max_finder.min_point
  end
end

strict_bound_finder = StrictBoundFinder.new
strict_bound_finder.read_data_and_find_min_max
puts strict_bound_finder.max_point
puts strict_bound_finder.min_point
