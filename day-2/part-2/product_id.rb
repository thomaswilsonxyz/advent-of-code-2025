class ProductId 
  attr_reader :value

  def initialize(the_id)
    @value = the_id 
  end

  def valid?
    return false if possible_repeating_chunks.any? { |chunk| value_is_chunk_repeated(chunk) }
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

  def possible_repeating_chunks
    (1..@value.size/2)
      .select { |n| @value.size % n == 0 }
      .map { |n| @value.slice(0,n) }
  end

  def value_is_chunk_repeated(the_chunk)
    @value.split(the_chunk).empty?
  end

end
