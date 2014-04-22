require_relative 'helper'

class CalUnitTestMonth < Test::Unit::TestCase
  def test_month_03_2015
    m = Month.new(03, 2015)
    expected_output = ['     March 2015       ', 'Su Mo Tu We Th Fr Sa  ', ' 1  2  3  4  5  6  7  ', ' 8  9 10 11 12 13 14  ', '15 16 17 18 19 20 21  ', '22 23 24 25 26 27 28  ', '29 30 31              ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_02_1800
    m = Month.new(02, 1800)
    expected_output = ['   February 1800      ', 'Su Mo Tu We Th Fr Sa  ', '                   1  ', ' 2  3  4  5  6  7  8  ', ' 9 10 11 12 13 14 15  ', '16 17 18 19 20 21 22  ', '23 24 25 26 27 28     ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_02_2012
    m = Month.new(02, 2012)
    expected_output = ['   February 2012      ', 'Su Mo Tu We Th Fr Sa  ', '          1  2  3  4  ', ' 5  6  7  8  9 10 11  ', '12 13 14 15 16 17 18  ', '19 20 21 22 23 24 25  ', '26 27 28 29           ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_02_1883
    m = Month.new(02, 1883)
    expected_output = ['   February 1883      ', 'Su Mo Tu We Th Fr Sa  ', '             1  2  3  ', ' 4  5  6  7  8  9 10  ', '11 12 13 14 15 16 17  ', '18 19 20 21 22 23 24  ', '25 26 27 28           ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_03_2014
    m = Month.new(03, 2014)
    expected_output = ['     March 2014       ', 'Su Mo Tu We Th Fr Sa  ', '                   1  ', ' 2  3  4  5  6  7  8  ', ' 9 10 11 12 13 14 15  ', '16 17 18 19 20 21 22  ', '23 24 25 26 27 28 29  ', '30 31                 ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_07_1800
    m = Month.new(07, 1800)
    expected_output = ['     July 1800        ', 'Su Mo Tu We Th Fr Sa  ', '       1  2  3  4  5  ', ' 6  7  8  9 10 11 12  ', '13 14 15 16 17 18 19  ', '20 21 22 23 24 25 26  ', '27 28 29 30 31        ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_12_2012
    m = Month.new(12, 2012)
    expected_output = ['   December 2012      ', 'Su Mo Tu We Th Fr Sa  ', '                   1  ', ' 2  3  4  5  6  7  8  ', ' 9 10 11 12 13 14 15  ', '16 17 18 19 20 21 22  ', '23 24 25 26 27 28 29  ', '30 31                 ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end

  def test_month_02_2015
    m = Month.new(02, 2015)
    expected_output = ['   February 2015      ', 'Su Mo Tu We Th Fr Sa  ', ' 1  2  3  4  5  6  7  ', ' 8  9 10 11 12 13 14  ', '15 16 17 18 19 20 21  ', '22 23 24 25 26 27 28  ', '                      ', '                      ']
    actual_output = m.get_lines

    assert_equal expected_output, actual_output
  end
end
