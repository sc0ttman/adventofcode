class Jump
  def initialize(input = 'input.txt')
    @input = input
    @index = 0
    @total_steps = 0
    @arr = []
    puts "processing input"
    process!
    do_jumps!
    puts "processing complete. There are #{@total_steps} jumps needed to get out"
  end

  def process!
    line_num=0
    text=File.open(@input).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      @arr << line.to_i
    end
  end

  def do_jumps!
    done = false
    while !done
      new_idx = @arr[@index]
      @arr[@index] += 1
      @index += new_idx
      @total_steps += 1
      done = true if @index < 0 || @index >= @arr.size
    end
  end
end

Jump.new()
