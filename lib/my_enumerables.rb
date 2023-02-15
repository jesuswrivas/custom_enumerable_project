module Enumerable

  def my_select(&block)
  newArray = []
      self.my_each do |x|
      newArray << x if block.call(x)
        
      end
    
    return newArray

  end



  def my_none?(&block)
    counter = 0
      self.my_each do |x|
      counter += 1 if block.call(x)
        
      end
    
    return counter == 0
    end



  def my_map(&block)
  new_array = []
    self.my_each do |x|
    new_array << block.call(x)
      
    end
  
  return new_array  
  end




  def my_inject(initial_value=0, &block)
    sum = initial_value
    self.my_each do |value|
     sum = block.call(sum,value)
      
    end
    return sum

  end


  def my_each_with_index(&block)
    y = 0
    self.my_each do |x|
      block.call(x,y)
      y += 1

    end

  end


  def my_count(&block)

    if block_given?
      counter = 0
      self.my_each do |x|
      counter += 1 if block.call(x)
      end
      
      return counter
    else
      return self.length
    end
  end
    

  def my_all?(&block)
  aux_array = []  
    self.my_each do |x|
    aux_array << block.call(x)
    end
  return aux_array.uniq.length == 1 && aux_array[0] == true
  end

  
  def my_any?(&block)
   
      self.my_each do |x|
      return true if block.call(x)
          
      end
      return false
  end

end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable

  def my_each 
    for i in 0..self.length-1 do
      yield (self[i])    
    end

    return self
  end
end

