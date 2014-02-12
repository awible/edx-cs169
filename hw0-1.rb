def sum(array)
  sum = 0
  array.each {|element| sum += element}
  sum
end
def max_2_sum(array)
  sum = 0
  largest = 0
  second_largest = 0
  array.each {|element|
    if (element > largest) 
      second_largest = largest
      largest = element
    else if (element > second_largest)
      second_largest = element
      end
    end
  } 
  largest + second_largest
end
def sum_to_n? (array, n)
  (0..(array.size-1)).each do |i|
    ((i+1)..(array.size-1)).each do |j|
      return true if array[i] + array[j] = n
      end
    end
  false
end
