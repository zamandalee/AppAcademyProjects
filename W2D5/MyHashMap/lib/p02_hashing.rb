class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    alphabet = ('a'..'z').to_a
    sum = 0
    
    each_with_index do |el, idx|
      sum += el * idx if el.is_a?(Integer)
      sum += alphabet.find_index(el.downcase) * idx if el.is_a?(String)
    end
    
    sum.hash
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    sum = 0
    
    chars.each_with_index do |letter, idx|
      sum += alphabet.find_index(letter.downcase) * idx
    end
    
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys.sort.map(&:to_s).hash
  end
end
