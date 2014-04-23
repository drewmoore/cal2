require_relative 'helper'

class TestCalIntegrationMonths < Test::Unit::TestCase
  def test_months_1
    expected_output = `cal 04 2014 -h`
    actual_output = `./cal2.rb 04 2014`

    assert_equal expected_output, actual_output
  end
end

class TestCalIntegrationYears < Test::Unit::TestCase
  def test_years_1
    expected_output = `cal 2014 -h`
    actual_output = `./cal2.rb 2014`

    assert_equal expected_output, actual_output
  end
end
