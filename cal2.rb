#!/usr/bin/env ruby
require_relative 'lib/month'
require_relative 'lib/year'

def get_input
  if ARGV.size == 2
    @month = ARGV[0].to_i
    @year = ARGV[1].to_i
  else
    @year = ARGV[0].to_i
  end
end

def output
  if @month
    m = Month.new(@month, @year)
    month_lines = m.get_lines

    puts month_lines
  else
    # Must initialize a dummy month to initialize class variables.
    m = Month.new(1, @year)
    y = Year.new(@year)
    year_lines = y.get_lines

    puts year_lines
  end
end

get_input
output
