a = %w( -1 0 5 -5 2 3 6).map{|z| z.to_i}
a = [ 1, 2]
#assert_triplets a,  [0, 5, -5], [-5, 2, 3]


def triplets(array)
  sums = Hash.new
  result = []
  array.each_with_index do |el1, i1|
    # el1 = -5, i1 = 3
    if sums[-el1]
      result += sums[-el1].map {|z| z + [el1]}
    end
    0.upto(i1-1) do |i2|
      el2 = array[i2] # el2 = -1
      sums[el1 + el2] ||= []
      sums[el1 + el2] << [el1, el2]
    end
  end
  result
end
puts triplets(a).inspect

# sums = {
#   -1 => [[-1, 0]],
#   -4 => [[-1, 5]]
#   5 => [[ 0, 5]]
# }
