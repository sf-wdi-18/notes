def merge(arr1, arr2)
  #check if there are any non numbers in either array
  return nil if (arr1 + arr2).any? { |num| num.class != Fixnum }
  #measure the length of each array
  len1 = arr1.length
  len2 = arr2.length
  #settup a counter for each array
  i = 0
  j = 0
  sorted_arr = []
  #loop stops when one array is checked fully
  while i < len1 && j < len2
    #if value in array 1 is less, push it
    if arr1[i] <= arr2[j]
      sorted_arr << arr1[i]
      i += 1
    else
      sorted_arr << arr2[j]
      j += 1
    end
  end
  #are there are remaining items in arr1?
  if i < len1
    sorted_arr += arr1[i..-1]
  else
    sorted_arr += arr2[j..-1]
  end
  sorted_arr
end