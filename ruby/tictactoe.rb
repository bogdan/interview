
# Solution

LINES = [
  [[0,0], [0,1], [0,2]],
  [[1,0], [1,1], [1,2]],
  [[2,0], [2,1], [2,2]],
  [[0,0], [1,0], [2,0]],
  [[0,1], [1,1], [2,1]],
  [[0,2], [1,2], [2,2]],
  [[0,0], [1,1], [2,2]],
  [[2,0], [1,1], [0,2]],
]

def line_completed?(x,y)
  LINES.any? do |line|
    line.include?([x,y]) && line.all? do |line_x,line_y|
      @arr[line_x][line_y] == @current_player
    end
  end
end

def win_zero
end

def win_x
end

