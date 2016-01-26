require_relative 'alphabet_pyramid'

unless ARGV.empty? then
  alphabet = ARGV[0]
else
  puts 'Please enter a character [a-zA-Z]:'
  alphabet = gets
end

begin
  AlphabetPyramid.new(alphabet).print_pyramid
rescue Exception => e
  puts e.message
end