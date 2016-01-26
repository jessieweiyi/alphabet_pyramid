class AlphabetPyramid
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
		line_number = 1;
		edge = @int_alphabet + 1 - UPPER_A;
		direction = +1;
		print_line(line_number, edge, direction);
	end

	def print_line(line_number, edge, direction)
		return nil if line_number == 0
		c = (UPPER_A + line_number - 1).chr
		l = Array.new(line_number+edge-1)

		i = 0
		while i < l.length
			l[i] = ' ';
			i += 1;
		end

		l[line_number+edge-2] = c
		l[edge-line_number] = c

		puts l.join

		direction = -1 * direction if line_number == edge

		print_line(line_number + direction, edge, direction)
	end
end