# Phase 1

Suppose you are about to code a tetris game.
You want a player to start from a particular heap not just from scratch.
Generate the heap of the required level


``` ruby
HEIGHT = 20
WIDTH = 10
def generate_heap(level)
end
```


# Phase 2

Implement the move function that suppose to receive the direction where the figure needs to be moved.
Use the UI module to update the board. 
If the figure can not be moved that direction, it should be left in place and new figure should be generated on the board.

``` ruby
# direction - left, right or down

def initialize
  @field = generate_heap(10)
  put_new_figure
end

def put_new_figure
end

def move(direction)
end


module UI
  def draw_pixel(x, y)
  end

  def clear_pixel(x, y)
  end
end
```
