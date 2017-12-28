class Spiral

  def initialize(num = 1)
    @target = num
    @map = []

    puts get_ring
  end

  def build_map
    i = 2
    ring_length = 8
    x = 0
    y = 0

    while i <= @target
      j = 0
      while j <= ring_length
        @map[i] = {}
      end

      ring_length += 8
      i++
    end

  end

  def get_moves
    min = get_ring
    # min += get_delta()
  end

  def get_ring
    ((@target + 1).to_f / 8).ceil
  end

  def get_side_length(ring)
    ring * 2 + 1
  end

  def get_position
    @target % 8
  end

  def get_ring_height
    @target * 2 + 1
  end
end

Spiral.new(26)
