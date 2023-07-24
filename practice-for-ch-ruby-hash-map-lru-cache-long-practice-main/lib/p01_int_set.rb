class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    if self.is_valid?(num) 
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store.each do |el|
      return true if el == true
    end
    false
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)
    
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store.each do |subarray|
      subarray.each do |el|
        return true if el == num
      end
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @store[num % num_buckets] << num if !@store[num % num_buckets].include?(num)
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store.each do |subarray|
      subarray.each do |el|
        return true if el == num
      end
    end
    false
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end