## Phase 1

TicTacToe 3x3 implementation:

``` ruby
def click(x,y)
end

module UI
  def put_x(x,y)
  end
  def put_o(x,y)
  end
end
```

## Phase 2

Game result coding into the click function
Using the following UI functions

``` ruby
module UI
  def draw_match
  end
  def win_x
  end
  def win_o
  end
end
```

# Phase 3

Extend field size to 10x10
5 X or O in a line required to win

# Phase 4

In the actual game, the winning sequence is usually highlighted with a crossing line
Please improve the win finding algorithm to return the winning coordinates 

# Phase 5

There could be multiple winning sequences in the game when 2 lines got completed with a single move.
It is pretty rare situation, but we want to support it in the UI. 
Improve the winning algorithm to return all completed lines instead of just first one
