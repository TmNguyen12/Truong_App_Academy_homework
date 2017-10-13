class LRUCache
    def initialize(num)
      @cache = Array.new
      @size = num
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
      end 

      if @cache.count < @size
        @cache.push(el)
      else
        @cache.shift
        @cache.push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    # private
    # # helper methods go here!
    # end

  end
