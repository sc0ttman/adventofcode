
require "csv"

class Checksum

  def initialize()
    @parsed_file = CSV.read("input.csv", { :col_sep => "\t" })
    @checksum = 0

    calculate!
  end

  def calculate!()
   # puts "Parsing! #{@parsed_file}"
    @parsed_file.each do |line|
      process_line!(line.sort_by(&:to_i))
    end

    puts "Calculating complete: #{@checksum}"
  end

  def process_line!(line)
    difference = line[-1].to_i - line[0].to_i
    puts "Higest: #{line[-1]} | Lowest: #{line[0]} | Difference: #{difference}"
    @checksum += difference
  end
end

Checksum.new
