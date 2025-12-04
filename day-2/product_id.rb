class ProductId 
  attr_reader :value

  def initialize(the_id)
    @value = the_id 
  end

  def valid?
    return false if even_length? and symmetrical?
    true
  end

  def to_i 
    @value.to_i
  end

  private

  def even_length?
    @value.size.even?
  end

  def symmetrical?
    @value == @value.slice(0..@value.size/2-1) * 2
  end

end
