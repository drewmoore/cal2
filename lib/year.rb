require_relative 'month'

class Year
  def initialize(year)
    @year = year.to_i
    @rows = 4
    @columns = 12 / @rows
    @width = Month.width * @columns
    @height = Month.height * @rows
  end

  def get_lines
    calendar = []
    # Make a header with the year centered.
    header = make_header

    # Gather an array of month arrays
    months = get_months

    # Assemble an array of lines for the calendar
    cal_lines = get_cal_lines(months)

    # Insert necessary blank lines
    cal_with_empties = insert_empties(cal_lines)

    # Put together final array
    cal_with_empties.each do | line |
      calendar << line
    end
    calendar.unshift header

    return calendar
  end

  private

  def make_header
    year = @year.to_s
    indent = ((@width - year.length) / 2) - 3
    indentation = " " * indent
    header = indentation + year
    return header
  end

  def get_months
    months_in_year = 12
    # Declare an array to return all month arrays.
    months = []

    months_in_year.times do | i |
      month = i + 1
      m = Month.new(month, @year)
      month_lines = m.get_lines(:year)
      months << month_lines
    end

    return months
  end

  def get_cal_lines(months)
    cal_lines = []

    # Create an empty array to represent the rows of the calendar to fill.
    @height.times do
      cal_lines << ""
    end

    # Iterate through the months and weeks, fill the calendar
    row = 0
    months.each_with_index do | month, month_no|
      month.each_with_index do | week, week_no|
        line_to_fill = week_no + (row * Month.height)
        cal_lines[line_to_fill] << week
      end
      # Carriage return
      if (month_no + 1) % @columns == 0
        row += 1
      end
    end
    return cal_lines
  end

  def insert_empties(cal_lines)
    month_height = Month.height
    offset = 0
    to_insert = ""
    empties_needed = @rows - 1

    empties_needed.times do | i |
      where_to_insert = (month_height * (i + 1)) + offset

      cal_lines.insert(where_to_insert, to_insert)

      offset += 1
    end

    return cal_lines
  end
end




















