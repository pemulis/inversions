# Calculate inversions in an array input as a text file 
#

def merge_sort(array)
  return array if array.size <= 1

  left = array.slice(0, (array.size / 2).round)
  right = array - left
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  a = []
  while !left.empty? and !right.empty?
    if left.first < right.first
      a<<left.shift
    else
      @@inversions += left.size
      a<<right.shift
      puts @@inversions
    end
  end
  a + left + right
end

@@inversions = 0

integer_txt = File.read('IntegerArray.txt')
array = integer_txt.split(/\r?\n/)
array = array.map!(&:to_i)
puts array[0]
puts array[1]
puts array[0] - array[1]

merge_sort(array)
puts "done!"
