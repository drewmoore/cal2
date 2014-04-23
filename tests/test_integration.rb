require_relative 'helper'

class TestCalIntegrationMonths < Test::Unit::TestCase
  def test_months_1
    expected_output = `cal 04 2014 -h`
    actual_output = `./cal2.rb 04 2014`

    assert_equal expected_output, actual_output
  end

  def test_months_error_found_1
    expected_output = `cal 09 2732 -h`
    actual_output = `./cal2.rb 09 2732`

    assert_equal expected_output, actual_output
  end

  def test_months_error_found_2
    expected_output = `cal 04 2320 -h`
    actual_output = `./cal2.rb 04 2320`

    assert_equal expected_output, actual_output
  end

  def test_months_error_found_3
    expected_output = `cal 09 2851 -h`
    actual_output = `./cal2.rb 09 2851`

    assert_equal expected_output, actual_output
  end

  def test_months_error_found_4
    expected_output = `cal 02 2656 -h`
    actual_output = `./cal2.rb 02 2656`

    assert_equal expected_output, actual_output
  end

  def test_months_random_numbers
    rand_month = rand(1..12).to_s
    rand_year = rand(1800..3000).to_s

    expected_output = `cal #{rand_month} #{rand_year} -h`
    actual_output = `./cal2.rb #{rand_month} #{rand_year}`

    assert_equal expected_output, actual_output
  end
end

class TestCalIntegrationYears < Test::Unit::TestCase
  def test_years_1
    expected_output = `cal 2014 -h`
    actual_output = `./cal2.rb 2014`

    assert_equal expected_output, actual_output
  end

  def test_years_incrementally
    # Tests every possible case in the range of the assignment. Skipped here because it takes a while to complete.
    skip

    time_span = (1800..3000)
    time_span.each do |i|
      expected_output = `cal #{i} -h`
      actual_output = `./cal2.rb #{i}`

      assert_equal expected_output, actual_output
    end
  end
end
















