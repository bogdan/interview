# Task

# Phase 1

# Generates a blank field with 3 random balls
def generate_field
end

# Puts 3 balls in random possitions of the random color to the field
def generate_random_balls(field)
end

module UI
  def put_ball(x,y,color)
  end
  def remove_ball(x,y)
  end
end


# Phase 2

# Moves the ball from cell to cell
# If line or lines of 5 or more balls of the same color exist
# Removes completed line or lines
# Otherwise puts 3 random balls on the field
def move(from_x, from_y, to_x, to_y)
end



# Solution

LINES = [
  # H
  [[0, 1], [0, -1]],
  # V
  [[1, 0], [-1, 0]],
  # D1
  [[1, 1], [-1, -1]],
  # D2
  [[1, -1], [-1, 1]],
]


def check_status(x,y)
  LINES.each do |line|
    count = 1
    color = @board[x][y]
     line.each do |direction|
      dx, dy = direction
      count += count_cells(x,y, dx, dy)
    end
    if count.size >= 5
      return true
    end
  end
  return false
end

def count_cells(x,y, dx, dy)
  count = 0
  loop do
    x = x + dx
    y = y + dx
    break if x < 0 || y < 0 || x >= DIMENSION || y >= DIMENSION
    color =
    break if @board[x][y] != color
    count += 1
  end
  count
end
