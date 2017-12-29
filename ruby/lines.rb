
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
