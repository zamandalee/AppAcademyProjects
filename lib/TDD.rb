def my_uniq(array)
  answer = []
  array.each {|el| answer << el unless answer.include?(el)}
  answer
end

class Array
  def two_sum
    pairs = []
    
    self[0...-1].each_with_index do |el, idx|
      self[idx+1..-1].each_with_index do |el2, idx2|
        pairs << [idx, idx2+1+idx] if el + el2 == 0
      end
    end
    pairs  
  end 
end

def my_transpose(arr)
  answer = Array.new(arr.length) {Array.new(arr.length)}
  arr.each_with_index do |row, idx|
    row.each_with_index do |el, idx2|
      answer[idx2][idx] = el
    end
  end
  answer
end

def stock_picker(arr)
  best_days = []
  greatest_diff = arr[1] - arr[0]

  arr.each_with_index do |buy, idx|
    j = idx + 1 
    while j < arr.length 
      current_diff = arr[j] - buy
      if current_diff > greatest_diff
        best_days = [idx, j]
        greatest_diff = current_diff
      end
      j += 1
    end
  end
  best_days
end