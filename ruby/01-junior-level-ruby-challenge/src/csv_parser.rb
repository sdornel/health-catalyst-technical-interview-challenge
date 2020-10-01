# frozen_string_literal: true

require 'csv'
require 'pry'

# require_relative 'data.csv'  

module CSVParser
  def self.header_row(filepath)
    parse = CSV.parse(File.new(filepath).each_line.first).first

      for h in 1..parse.length-1 do
        if parse[h] == nil
          parse[h] = "Header value cannot be processed! Check if header == nil!"
        end
      end
      parse.map(&:downcase)      
  end
end
  # CSV.parse(File.new(filepath).each_line.first).first.map(&:downcase)
  # Maybe I'm overthinking but I couldn't figure out how to create the error described in the readme without first modifying the line of code I started with 
  # I tried modifying a .csv file so that the header would be missing, have only commas, and have various combinations of commas and other characters
  # I decided to fix a different issue ```NoMethodError: undefined method `downcase' for nil:NilClass```

  # NoMethodError: undefined method `map' for nil:NilClass means CSV.parse(File.new(filepath).each_line.first).first gives nil

# headers: true # Removes headers from read 
# CSV.parse(File.open('src/data.csv').each_line.first, {:headers => true}).first = nil
# CSV.parse(File.open('src/data.csv').each_line.first, headers: true).first.map = nil