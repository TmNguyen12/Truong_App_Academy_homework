class Stack
   def initialize
     # create ivar to store stack here!
     @array = []
   end

   def add(el)
     # adds an element to the stack
     @array << el
   end

   def remove
     # removes one element from the stack
     @array.pop
   end

   def show
     # return a copy of the stack
     p @array
   end

end

class Queue
  def initialize
    @array = []
  end

  def enqueue(el)
    @array << el
  end

  def dequeue
    @array.shift
  end

  def show
    @array.dup
  end

end

class Map
  def initialize
    @dict = []
  end

  def assign(key,value)
    if !key_exist?(key)
      @dict << [key,value]
    else
      @dict.each do |arr|
        arr[1] = value if arr[0] == key
      end
    end
  end

  def lookup(key)
    if @dict.empty?
      return nil
    else
      @dict.each do |arr|
        return arr[1] if arr[0] == key
      end
    end
  end

  def remove(key)
    if @dict.empty?
      return nil
    else
      @dict.reject! {|arr| arr[0] == key}
    end
    @dict
  end

  def show
    deep_dup(@dict)
  end

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end 
  end

  def key_exist?(key)
    if @dict.empty?
      return false
    else
      @dict.each do |arr|
        return true if arr[0] == key
      end
    end
    false
  end

end
