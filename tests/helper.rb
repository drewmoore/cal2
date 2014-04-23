require 'minitest/autorun'
require 'test/unit'
require_relative '../lib/zellers.rb'
require_relative '../lib/month.rb'
require_relative '../lib/year.rb'

def strip_control_characters_and_excesses(string)
  last =  string.split("\033[2;0f").last#.gsub(/(\e\[\d+\w)|(\e\[\w)/,"")
  if last.empty?
    ""
  else
    last.gsub(/(\e\[\d+\w)|(\e\[\w)/,"").gsub(" +","")
  end
end

def assert_includes_in_order input, *items
  input = strip_control_characters_and_excesses(input)
  regexp_string = items.join(".*").gsub("?","\\?")
  assert_match /#{regexp_string}/, input.delete("\n"), "Expected /#{regexp_string}/ to match:\n" + input
end
