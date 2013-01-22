require_relative "point"

class PointDataReader
  def initialize(file_name)
    @file_name = file_name
  end

  def read_points_data
    points = []
    File.open(@file_name, "r") do |file|
      file.each do |line|
        point_data = extract_point_data_from(line)
        points << create_point_from(point_data)
      end
    end
    points
  end

  private
    def extract_point_data_from(line)
      point_data = line.split(/ |\t/)
      point_data = point_data.map(&:chomp).map(&:to_f)
      point_data.delete("")
      point_data
    end

    def create_point_from(point_data)
      Point.new(point_data[0], point_data[1], 
                point_data[2], point_data[3].to_b)
    end
end
