require 'byebug'


def first_anagram?(str1, str2) #factorial, O(n!)
  anagrams = str1.chars.permutation.to_a
  anagrams.include?(str2.chars)
end

def second_anagram?(str1, str2) #n^2 (double iteration)
  arr1 = str1.chars
  arr2 = str2.chars
  
  str1.chars.each do |char|
    if arr2.include?(char)
      arr1.delete(char)
      arr2.delete(char)
    end 
  end 
  
  return arr1.empty? && arr2.empty?
end 


def third_anagram?(str1, str2) #n^2 (quicksort)
  return str1.chars.sort == str2.chars.sort
end 

def fourth_anagram?(str1, str2) #n (n + n + n)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  
  str1.chars.each do |char|
    h1[char] += 1
  end
  
  str2.chars.each do |char|
    h2[char] += 1
  end
  
  return h1 == h2
end