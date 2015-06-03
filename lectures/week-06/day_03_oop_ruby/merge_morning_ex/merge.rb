def merge(arr1, arr2)
  #check if there are any non numbers in either array
  return nil if (arr1 + arr2).any? { |num| num.class != Fixnum }
  #measure the length of each array
  arr1_len = arr1.length
  arr2_len = arr2.length
  #settup a counter for each array
  counter1 = 0
  counter2 = 0
  sorted_arr = []
  #while loop stops when one the counters equals the size of their repective array
  while counter1 < arr1_len && counter2 < arr2_len
    #if value in array 1 is less, push it
    if (arr1[counter1] <= arr2[counter2])
      sorted_arr << arr1[counter1]
      counter1 += 1
    else
      sorted_arr << arr2[counter2]
      counter2 += 1
    end
  end
  #a lower counter indicates the array still has items left in it
  #push the remainder of that array
  if counter1 < counter2
    sorted_arr << arr1[counter1..-1]
  else
    sorted_arr << arr2[counter2..-1]
  end
  sorted_arr.flatten
end