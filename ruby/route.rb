def route_exists?(x1, y1, x2, y2)
  #@field[x][y] # => nil
  #@field[x][y] # => Ball.new
  @spaces = []

  @field.each_with_index do |x_array, i|
    x_array.each_with_index do |el, y|
      if(el==nil?)
        @space = @spaces.select{|f| f.include?(x-1,y) && f.include?(x,y-1)}.first || (@spaces << Space.new)
        @space.add(x,y)
      end
    end
  end

  space_1_array = @spaces.select{|f| f.include?(x1-1,y1) && f.include?(x1+1,y1) && f.include?(x1,y-1) && f.include?(x1,y1+1)}
  space_2_array = @spaces.select(x2,y2)

  (space_1 & space_2).any?
end

class Space
  def initialize

  end

end




