require_relative 'zellers.rb'

class Month
  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
    @width = 22
    @height = 8
    @number_of_cells = 42
  end

  def get_lines(*args)
    lines_array = []
    # Get array with two strings: a centered month + year (or just month), and the abbreviated days
    header = make_header(:month)

    # Calculate number of days in the month
    number_of_days = get_number_of_days

    # Generate an array of day numbers and blank cells for spacing.
    days_array = get_days(number_of_days)

    # Generate an array of 'weeks', based on array of days.
    weeks_array = get_weeks(days_array)

    # Load the final array to be returned.
    header.each do | head |
      lines_array << head
    end
    weeks_array.each do | week |
      lines_array << week
    end

    return lines_array
  end

  private

  def make_header(month_year)
    # Convert month number to an English word
    month_string = make_month_string

    # Make a string with either month and year, or just month if displaying a full year calendar
    if month_year == :month
      date_string = month_string + " " +@year.to_s
    else
      date_string = month_string
    end

    # Calculate measurements for centering header
    indent_left = ((@width - date_string.size) / 2) - 1
    indent_right = @width - date_string.size - indent_left
    indentation_left = " " * indent_left
    indentation_right = " " * indent_right

    # Create centered header string with appropriate white space
    month_header = indentation_left + date_string + indentation_right

    # Get an aligned string of abbreviated days, i.e. 'Mo', 'Tu', etc.
    days_header = make_days_header

    # Combine main header (month, year or whatever) with abbreviated days into array. Return this.
    header = [month_header, days_header]
  end

  def make_month_string
    month_string = ""
    case @month
    when 1
      month_string = "January"
    when 2
      month_string = "February"
    when 3
      month_string = "March"
    when 4
      month_string = "April"
    when 5
      month_string = "May"
    when 6
      month_string = "June"
    when 7
      month_string = "July"
    when 8
      month_string = "August"
    when 9
      month_string = "September"
    when 10
      month_string = "October"
    when 11
      month_string = "November"
    when 12
      month_string = "December"
    end
    return month_string
  end

  def make_days_header
    days_header = "Su Mo Tu We Th Fr Sa  "
  end

  def get_number_of_days
    # Find out which day the month starts on
    starting_day = Zellers.calc(@month, 1, @year)

    # Find out which day the next month starts on. For calculating number of days in month
    next_month_start = Zellers.calc((@month + 1), 1, @year)

    # Calculate number of days in month, based on zeller's starting and ending days
    days_difference = next_month_start - starting_day
    if days_difference < 0
      days_difference *= -1
    end
    # Using 28 as a base because that is the least number of days in any month.
    number_of_days = 28 + days_difference
  end

  def get_days(number_of_days)
    days_array = []
    blank_1 = " "
    blank_2 = "  "

    # Determine where first of month falls. Convert into array-index-friendly integer.
    # Zeller's returns a 0 for Saturday. We want Saturday to be 6, based on its index position.
    starting_day = Zellers.calc(@month, 1, @year)
    if starting_day == 0
      starting_day = 7
    end
    starting_day -= 1

    # Insert blank 'cells' to beginning of month, if the month doesn't start on a Sunday,
    # i.e. 3 blank cells for a month with Wednesday as the 1st.
    starting_day.times do
      days_array << blank_2
    end

    # Fill in the day numbers. Each 'cell' needs to be a uniform width.
    # Therefore, single-digit numbers are given a blank space in front.
    number_of_days.times do |i|
      to_insert = (i + 1).to_s
      if to_insert.size == 1
        to_insert.prepend blank_1
      end
      days_array << to_insert
    end

    # Add empty cells to end of array to take up any necessary white space. Based on a predetermined number of 'cells' in
    # a calendar of a fixed size.
    blank_cells_needed = @number_of_cells - days_array.size
    blank_cells_needed.times do
      days_array << blank_2
    end

    days_array
  end

  def get_weeks(days)
    weeks = []
    days_in_week = 7
    blank_1 = " "

    # Determine number of rows that need to be filled. Height minus the two headers. Just in case
    # this needs to be calculated dynamically later on.
    rows = @height - 2

    # Fill weeks array with empty 'rows' to be appended
    rows.times do |i|
      weeks[i] = ""
    end

    # Manipulate the incoming array to fill the rows of the weeks array.
    row_no = 0
    days.each_with_index  do | cell, index |
      weeks[row_no] << cell + blank_1 unless row_no >= rows
      if ( index + 1 ) % days_in_week == 0
        weeks[row_no] << blank_1
        row_no += 1
      end
    end

    weeks
  end
end























