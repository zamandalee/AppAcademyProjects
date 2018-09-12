require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    unless include?(key)
      @count += 1
      resize! if @count == num_buckets
      bucket(key).append(key, val)
    else 
      bucket(key).update(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key) 
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
    
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = num_buckets * 2
      
    temp = HashMap.new(new_buckets)
    each do |key, val|
      temp.set(key, val)
    end
    @store = temp.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
  
end
