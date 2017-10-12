# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# Sluggish Octopus O(n^2) time
# bubble sort, nested loops
def sluggish_octopus
  pond = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  longest = pond[0]
  f_length = pond[0].length

  pond[1..-1].each_with_index do |word|
    (0...pond.length).each_with_index do |el, idx|
      if pond[idx].length < f_length
      end
        if word.length > f_length
          longest = word
          f_length = word.length
        end
      end
  end
  puts longest

end

# Dominant Octopus
#
# Find the longest fish in O(n log n) time.
# Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo.
# Remember that Big O is classified by the dominant term.
# Merge or Quick Sort
def dominant_octopus(arr)
  sorted = merge_sort(arr).last
  puts("dominant - #{sorted}")
end

def merge_sort(arr,&prc)
  return arr if arr.length <= 1

  prc ||= Proc.new{|a,b| a.length <=>b.length}

  if arr.length.odd?
    mid = arr.length/2
  else
    mid = (arr.length/2) - 1
  end

  left = merge_sort(arr[0..mid],&prc)
  right = merge_sort(arr[mid+1..-1],&prc)

  merge(left,right,&prc)

end

def merge(left,right,&prc)
  arr = []

  until left.empty? || right.empty?
    case prc.call(left.first,right.first)
    when -1
      arr << left.shift
    when 0
      arr << left.shift
      arr << right.shift
    when 1
      arr << right.shift
    end
  end
  arr + left + right
end

# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the array only once.
def clever(arr)
  longest = arr[0]
  f_length = arr[0].length

  arr[1..-1].each_with_index do |word|
    if word.length > f_length
      longest = word
      f_length = word.length
    end
  end
  puts "clever - #{longest}"

end

# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume
# that the octopus's eight tentacles are numbered and correspond to the tile direction indices.


if __FILE__ == $PROGRAM_NAME

  pond=['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  # sluggish_octopu
  dominant_octopus(pond)
  clever(pond)
end
