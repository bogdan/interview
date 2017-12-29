# Phase 1

Generate a random labyrinth as a field where each cell can be free to pass or taken by a stone

``` ruby
def generate_labyrinth(dimension, number_of_stones)
end
```

# Phase 2

Implement a function that would return true if the free cells route exists between 2 positions.
Only horizontal and vertical movement allowed. No diagonals

``` ruby
def route_exists?(from_x, from_y, to_x, to_y)
end
```

# Phase 3

Improve the previous function to return the found route so that the UI can draw the trace of the character movement inside a labyrinth.

``` ruby
def find_route(from_x, from_y, to_x, to_y)
end
```

# Phase 4

Improve the algorithm to always return the shortest route.
