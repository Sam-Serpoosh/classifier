require_relative "min_max_finder"

describe MinMaxFinder do
  context "#finding_max" do
    it "updates the max when the point is acceptable" do
      point1 = stub(:x => 2, :y => 3, :z => 4, :acceptable => true) 
      point2 = stub(:x => 3, :y => 2, :z => 3, :acceptable => true)
      subject.update_max(point1)
      check_max(2, 3, 4)

      subject.update_max(point2)
      check_max(3, 3, 4)
    end

    it "does not update max when point is not acceptable" do
      point = stub(:x => 1, :y => 2, :z => 3, :acceptable => false)
      subject.update_max(point)
      check_max(MinMaxFinder::MIN_VALUE, MinMaxFinder::MIN_VALUE, MinMaxFinder::MIN_VALUE)
    end

    it "gives the max point" do
      point = stub(:x => 1, :y => 2, :z => 3, :acceptable => true) 
      subject.update_max(point)
      max_point = subject.max_point
      max_point.x.should == 1
      max_point.y.should == 2
      max_point.z.should == 3
    end

    def check_max(expected_x, expected_y, expected_z)
      subject.x_max.should == expected_x
      subject.y_max.should == expected_y
      subject.z_max.should == expected_z
    end
  end

  context "#finding_max" do
    it "updates the min when the point is acceptable" do
      point1 = stub(:x => 2, :y => 3, :z => 4, :acceptable => true) 
      point2 = stub(:x => 3, :y => 2, :z => 3, :acceptable => true)
      subject.update_min(point1)
      check_min(2, 3, 4)

      subject.update_min(point2)
      check_min(2, 2, 3)
    end

    it "does not update max when point is not acceptable" do
      point = stub(:x => 1, :y => 2, :z => 3, :acceptable => false)
      subject.update_min(point)
      check_min(MinMaxFinder::MAX_VALUE, MinMaxFinder::MAX_VALUE, MinMaxFinder::MAX_VALUE)
    end

    it "gives the min point" do
      point = stub(:x => 1, :y => 2, :z => 3, :acceptable => true)
      subject.update_min(point)
      min_point = subject.min_point
      min_point.x.should == 1
      min_point.y.should == 2
      min_point.z.should == 3
    end

    def check_min(expected_x, expected_y, expected_z)
      subject.x_min.should == expected_x
      subject.y_min.should == expected_y
      subject.z_min.should == expected_z
    end
  end
end
