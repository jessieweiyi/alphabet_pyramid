require_relative "alphabet_pyramid"
require "minitest/autorun"
 
class TestAlphabetPyramid < MiniTest::Test

  EXPECTED_FOR_A = ['A']

  EXPECTED_FOR_E = [
              '    A',
              '   B B',
              '  C   C',
              ' D     D',
              'E       E',
              ' D     D',
              '  C   C',
              '   B B',
              '    A']

  EXPECTED_FOR_G = [
              '      A',
              '     B B',
              '    C   C',
              '   D     D',
              '  E       E',
              ' F         F',
              'G           G',
              ' F         F',
              '  E       E',
              '   D     D',
              '    C   C',
              '     B B',
              '      A']

  EXPECTED_FOR_Z = [
              '                         A',
              '                        B B',
              '                       C   C',
              '                      D     D',
              '                     E       E',
              '                    F         F',
              '                   G           G',
              '                  H             H',
              '                 I               I',
              '                J                 J',
              '               K                   K',
              '              L                     L',
              '             M                       M',
              '            N                         N',
              '           O                           O',
              '          P                             P',
              '         Q                               Q',
              '        R                                 R',
              '       S                                   S',
              '      T                                     T',
              '     U                                       U',
              '    V                                         V',
              '   W                                           W',
              '  X                                             X',
              ' Y                                               Y',
              'Z                                                 Z',
              ' Y                                               Y',
              '  X                                             X',
              '   W                                           W',
              '    V                                         V',
              '     U                                       U',
              '      T                                     T',
              '       S                                   S',
              '        R                                 R',
              '         Q                               Q',
              '          P                             P',
              '           O                           O',
              '            N                         N',
              '             M                       M',
              '              L                     L',
              '               K                   K',
              '                J                 J',
              '                 I               I',
              '                  H             H',
              '                   G           G',
              '                    F         F',
              '                     E       E',
              '                      D     D',
              '                       C   C',
              '                        B B',
              '                         A']
 
  def test_invalid_input
    assert_raises(RuntimeError, 'INVALID_INPUT') do
      AlphabetPyramid.new('*')
    end

    assert_raises(RuntimeError, 'INVALID_INPUT') do
      AlphabetPyramid.new('5')
    end

    assert_raises(RuntimeError, 'INVALID_INPUT') do
      AlphabetPyramid.new('AB')
    end

    assert_raises(RuntimeError, 'INVALID_INPUT') do
      AlphabetPyramid.new('ab')
    end
  end

  def test_initialization
    assert_equal(65, AlphabetPyramid.new('A').int_alphabet)
    assert_equal(65, AlphabetPyramid.new('a').int_alphabet)

    assert_equal(90, AlphabetPyramid.new('Z').int_alphabet)
    assert_equal(90, AlphabetPyramid.new('z').int_alphabet)
  end 

  def test_uppercase
   actual = with_captured_stdout_as_array { AlphabetPyramid.new('E').print_pyramid }

    assert_equal(EXPECTED_FOR_E, actual);
  end

  def test_lowercase
    actual = with_captured_stdout_as_array { AlphabetPyramid.new('g').print_pyramid }

    assert_equal(EXPECTED_FOR_G, actual);
  end

  def test_letter_upper_a
    actual = with_captured_stdout_as_array { AlphabetPyramid.new('A').print_pyramid }

    assert_equal(EXPECTED_FOR_A, actual)
  end

  def test_letter_lower_a
    actual = with_captured_stdout_as_array { AlphabetPyramid.new('a').print_pyramid }

    assert_equal(EXPECTED_FOR_A, actual)
  end

  def test_letter_upper_z
    actual = with_captured_stdout_as_array { AlphabetPyramid.new('Z').print_pyramid };

    assert_equal(EXPECTED_FOR_Z, actual);
  end

  def test_letter_lower_z
    actual = with_captured_stdout_as_array { AlphabetPyramid.new('z').print_pyramid };

    assert_equal(EXPECTED_FOR_Z, actual);
  end

  def with_captured_stdout_as_array
    begin
      old_stdout = $stdout
      $stdout = StringIO.new('','w')
      yield
      $stdout.string.split(/\n+/)
    ensure
      $stdout = old_stdout
    end
  end
end