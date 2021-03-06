class AlphabetPyramid
  attr_accessor :int_alphabet

  UPPER_A = 'A'.ord
  UPPER_LOWER_DIFF = 'a'.ord - 'A'.ord

  def initialize(alphabet)
    raise 'INVALID INPUT' unless alphabet[/^[a-zA-Z]$/]

    @int_alphabet = alphabet.ord

    if @int_alphabet > 90 then
      @int_alphabet = @int_alphabet - UPPER_LOWER_DIFF
    end
  end

  def print_pyramid
    edge = @int_alphabet + 1 - UPPER_A;
    print_line(1, edge, +1);
  end

  def print_line(line_number, edge, direction)
    return nil if line_number == 0
    c = (UPPER_A + line_number - 1).chr
    l = Array.new(line_number+edge-1, ' ')

    l[line_number+edge-2] = c
    l[edge-line_number] = c

    puts l.join

    direction = -1 * direction if line_number == edge

    print_line(line_number + direction, edge, direction)
  end
end