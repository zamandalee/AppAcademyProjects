require 'byebug'

def range(start, finish)
  return [] if finish <= start
  finish -= 1
  range(start, finish) << finish
end

def iter_sum_arr(arr)
  arr.inject(0) {|sum, i| sum += i}
end

def rec_sum_arr(arr)
  return 0 if arr.empty?
  rec_sum_arr(arr[1..-1]) + arr[0]
end

def exp_1(b,n)
  return 1 if n < 1
  b * exp_1(b, n-1)
end

def exp_2(b, n)
  return 1 if n < 1
  if n.even?
    exp_2(b, n / 2) * exp_2(b, n / 2)
  else
    b * (exp_2(b, (n-1) / 2) * exp_2(b, (n-1) / 2))
  end
end

class Array
  def deep_dup
    return [] if self.empty?
    duplicate = []
    self.each do |el|
      el.is_a?(Array) ? duplicate << el.deep_dup : duplicate << el
    end
    duplicate
  end
end

def iter_fibonacci(n)
  raise "Number is less than 2" if n < 2
  fib = [1,1]
  (n - 2).times do |num|
    fib << fib.last + fib[-2]
  end
  fib
end

def rec_fibonacci(n)
  return [1,1] if n < 3
  fib = rec_fibonacci(n - 1)
  fib << fib[-1] + fib[-2]
end

def bsearch(array, target)
  middle_loc = array.length / 2
  middle_el = array[middle_loc]

  return middle_loc if middle_el == target
  return nil if array.length == 1

  if middle_el < target #if middle_loc - 1 is nil, error?
    bsearch(array[middle_loc..-1], target) + middle_loc
  elsif middle_el > target
    bsearch(array[0...middle_loc], target)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2
  merge( merge_sort(arr[0...middle]), merge_sort(arr[middle..-1]) )
end

def merge(right, left)
  merged = []

  until left.empty? || right.empty?
    if right[0] < left[0]
      merged << right.shift
    else
      merged << left.shift
    end
  end
  merged + right + left
end

# def subsets(arr)
#   return [[]] if arr.empty?
#   sub_arr = subsets(arr[0...-1])
#   new_subsets = sub_arr.dup
#
#   sub_arr
#   sub_arr.each do |el|
#     new_subsets << el += [arr[-1]]
#   end
#   new_subsets
# end

def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets( arr.take(arr.length - 1) )
  subs.concat(subs.map {|sub| sub + [arr.last] })
end

def permutations(array)
  #byebug
  return array if array.length == 1
  option = []
  perm = permutations(array[1..-1])
  # array[0...-1].each do |el|
    perm.each do |perm_el|
      option << [perm_el, array[0]]
      option << [array[0], perm_el]
    end
  # end
  option
end

def make_change(amount, coins = [25, 10, 5, 1])
  coins.sort.reverse
  return [] if amount == 0
  # coins.each do |coin|
  # change = []
  # byebug
  num_coin = amount / coins.first
  unless num_coin == 0
    amount -= num_coin * coins.first
    num_coin.times { |i| make_change(amount, coins[1..-1]) << coins.first }
  end

  # end
end

if __FILE__ == $0
  p make_change(39)
end


def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }

  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target

    remainder = target - coin

    best_remainder = make_change(remainder, coins.drop(index))

    next if best_remainder.nil?

    this_change = [coin] + best_remainder

    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end
  end

  best_change
end
