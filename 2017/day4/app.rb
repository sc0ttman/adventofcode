class Passphrase

  def initialize(input = 'input.txt')
    @input = input
    @valid = 0
    @total = 0
    puts "processing input"
    process!
    puts "processing complete. There are #{@valid} valid phrases out of #{@total}"
  end

  def process!
    line_num=0
    text=File.open(@input).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
     validate_phrase(line)
     @total += 1
    end
  end

  def validate_phrase(line)
    words = line.split
    invalid = words.detect{ |e| words.count(e) > 1 }
    unless invalid
      @valid += 1
    end
  end

end

Passphrase.new()
