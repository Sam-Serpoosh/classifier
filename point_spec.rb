require_relative "point"

describe Point do
  it "sets the values at creation" do
    point = Point.new(1, 2, 3, false)
    point.x.should == 1
    point.y.should == 2
    point.z.should == 3
    point.acceptable.should be_false
  end

  it "convets to well formatted string" do
    Point.new(1, 2, 3, false).to_s.should == "1 2 3: false"
  end
end
