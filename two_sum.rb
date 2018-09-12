def bad_two_sum?(arr, target) #O(n^2) time complexity
  (0...arr.length - 1).each do |idx|
    (idx + 1...arr.length).each do |jdx|
      return true if arr[idx] + arr[jdx] == target
    end
  end
  
  false
end

def okay_two_sum?(arr, target)
  arr = arr.sort  #[1,2,3,3,4] target = 7
  
  arr.each_with_index do |num, i|
    new_target = target - num
    idx = arr[i + 1..-1].b_search(new_target)
    return true unless idx.nil?
  end 
  
  false
end 

class Array
  
  def b_search(target, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    
    return nil if length == 0
    middle = length / 2
    
    case prc.call(self[middle], target)
    when 0
      return middle
    when 1
      return self.dup.take(middle).b_search(target, &prc)
    else
      search_res = self.dup.drop(middle + 1).b_search(target, &prc)
      search_res.nil? ? nil : middle + 1 + search_res
    end
  end
  
end