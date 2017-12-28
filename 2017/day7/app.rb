class Node
  attr_accessor :name, :weight, :list

  def initialize(name=nil, weight=nil, list=nil)
    @name = name
    @weight = weight
    @list = list
  end
end

class Tower
  attr_reader :tree, :count
  def initialize(input = 'input.txt')
    @input = input
    @tree = {}
    @count = 0
    @not = [] # decided to make a list of keys that CANT be the base

    puts "processing input"
    import_names!
    build_tree!
    sort_tree!
    #puts "processing complete. There are #{@total_steps} redistrobution cycles before a repeat"
    puts "tree size: #{@tree.size}"
    puts @tree.keys - @not.flatten # subtract to find the base
  end

  def import_names!
    text=File.open(@input).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      name, weight, nodes = process_line(line)
      @tree[name] = Node.new(name, weight, nodes)
    end
  end

  def process_line(line)
    line = line.split(' ')
    weight = line[1][1..-2]
    return [line[0], weight] if line.size == 2
    list = line[3..-1].join('').split(',')
    @not << list
    @count += list.size
    [line[0], weight.to_i, list]
  end

  def build_tree!
    @tree.each do |name, node|
      if node.list
        for child_name in node.list
          @tree.delete(child_name) if @tree.has_key?(child_name)
        end
      end
    end
  end

  def sort_tree!

  end
end

Tower.new(input = 'input.txt')
