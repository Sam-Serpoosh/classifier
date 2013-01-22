require_relative "point_data_reader"
require_relative "strict_bound_finder"

class Classifier
  attr_reader :positive_points, :negative_points

  def initialize(point_data_reader = PointDataReader.new("test_set"))
    @point_data_reader = point_data_reader
    @strict_bound = StrictBoundFinder.new
    @strict_bound.read_data_and_find_min_max
    @positive_points = []
    @negative_points = []
  end

  def classify
    test_points = @point_data_reader.read_points_data
    @min_point = @strict_bound.min_point
    @max_point = @strict_bound.max_point
    put_points_in_appropriate_class(test_points)
  end

  def put_points_in_appropriate_class(test_points)
    test_points.each do |point|
      if in_positive_area(point)
        @positive_points << point
      else
        @negative_points << point
      end
    end
  end

  def in_positive_area(point)
    point.x <= @max_point.x && point.x >= @min_point.x &&
    point.y <= @max_point.y && point.y >= @min_point.y &&
    point.x <= @max_point.z && point.z >= @min_point.z
  end
end

classifier = Classifier.new
classifier.classify
p classifier.positive_points
p classifier.negative_points
