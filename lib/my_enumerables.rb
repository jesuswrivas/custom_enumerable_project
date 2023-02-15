module Enumerable

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
      
      return false
      end
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



# newArray = [1,2,3,4,1,2,6,4]
 #puts newArray.my_count
