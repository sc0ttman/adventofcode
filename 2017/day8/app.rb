class Registers
  attr_reader :registers, :instructions

  def initialize(input = 'input.txt')
    @input = input
    @registers = {}
    @instructions = []

    puts "processing input"
    import_instructions!
    process_instructions!
    puts "Highest register value is: #{@registers.values.max}"
  end

  def import_instructions!
    text=File.open(@input).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      result = process_line(line)
      @instructions << result
      #puts "adding key #{result[:name]}"
      @registers[result[:name]] = 0 unless @registers.has_key?(result[:name])
    end
  end

  def process_line(line)
    line = line.split(' ')
    {
      name: line[0],
      instruction: line[1],
      amount: line[2].to_i,
      op_name: line[4],
      cond: line[5],
      op_amount: line[6].to_i
    }
  end

  def process_instructions!
    for inst in @instructions
      next if !condition_true(inst)
      @registers[inst[:name]] += instruction_amount(inst)
      #puts "cond true: #{inst[:name]}: #{@registers[inst[:name]]}"
    end
  end

  def condition_true(inst)
    statement = "#{@registers[inst[:op_name]]} #{inst[:cond]} #{inst[:op_amount]}"
    eval(statement)
  end

  def instruction_amount(inst)
    return inst[:amount] if inst[:instruction] == 'inc'
    -(inst[:amount])
  end
end

Registers.new('input.txt')
