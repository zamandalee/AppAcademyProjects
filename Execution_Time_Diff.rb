def bad_my_min(arr) #bubble sort, Quadratic, O(n^2)
  sorted = false
  
  until sorted
    sorted = true
    arr[0...-1].each_with_index do |el, idx|
      if el > arr[idx+1]
        sorted = false
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
      end 
    end 
  end 
  arr.first
  
end 

def my_min(arr) #linear, O(n)
  min = arr.first
  
  arr.each do |el|
    min = el if el < min
  end
  
  min
end 

def bad_cont_sub_sum(arr) #quadratic, O(n^2)
  sub_arr = []
  
  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      next if idx2 < idx
      sub_arr << arr[idx..idx2]
    end 
  end 
    
  sub_arr.map! do |array|
    array.reduce(:+)
  end
  
  sub_arr.sort.last
end 

def cont_sub_sum(arr)
  largest = arr.first
  
  arr.each_with_index do |el, idx|
    idx2 = idx
    while idx2 < arr.length
      current_sum = arr[idx..idx2].reduce(:+)
      largest = current_sum if current_sum > largest
      idx2 += 1
    end 
  end
  
  largest
end


