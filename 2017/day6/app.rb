class Defrag
  attr_reader :memory, :history
  def initialize(input = 'input.txt')
    @input = input
    @index = 0
    @total_steps = 0
    @memory = []
    @history = {}

    puts "processing input"
    set_memory!
    reallocate!
    set_index!
    puts "processing complete. There are #{@total_steps} redistrobution cycles before a repeat"
    puts "History size: #{@history.size}"
  end

  def set_memory!
    line_num=0
    text=File.open(@input).readline
    @memory = text.split(/\t/).map(&:to_i)
  end

  def reallocate!
    while !done
      set_index!
      save_history!
      #puts @index
      d = @memory[@index]
      @memory[@index] = 0
      while d > 0
        @index = (@index + 1 >= @memory.size) ? 0 : @index + 1
        @memory[@index] += 1
        d -= 1
      end
      @total_steps += 1
    end
  end

  def set_index!
    @index = @memory.index(@memory.max)
  end

  def save_history!
    #puts "saving history: #{memory_hash}"
    @history[memory_hash] = true
  end

  def done
    @history.has_key?(memory_hash)
  end

  def memory_hash
    "#{@memory.join('_')}"
  end
end

Defrag.new(input = 'input.txt')
