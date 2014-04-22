require_relative 'helper'

class CalUnitTestZellers < MiniTest::Unit::TestCase
  def test_01_01_2014
    assert_equal 4, Zellers.calc(01, 01, 2014)
  end

  def test_leap_year
    assert_equal 3, Zellers.calc(02, 29, 2000)
  end

  def test_another_leap_year
    assert_equal 1, Zellers.calc(02, 29, 2004)
  end

  def test_random_date
    assert_equal 2, Zellers.calc(12, 28, 1981)
  end

  def test_random_date_2
    assert_equal 1, Zellers.calc(02, 01, 2015)
  end

  def test_edge_case_1800
    assert_equal 4, Zellers.calc(01, 01, 1800)
  end

  def test_edge_case_3000
    assert_equal 4, Zellers.calc(12, 31, 3000)
  end
end
