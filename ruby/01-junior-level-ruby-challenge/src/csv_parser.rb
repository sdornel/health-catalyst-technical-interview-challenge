# frozen_string_literal: true

require 'csv'
require 'pry'

# require_relative 'data.csv'  

module CSVParser
  def self.header_row(filepath)
    binding.pry
    parse = CSV.parse(File.new(filepath).each_line.first).first
    if parse.nil?
      parse = ["headers missing!"]
      parse.first.map(&:downcase)
    else
      CSV.parse(File.new(filepath).each_line.first).first.map(&:downcase)
    end

  end
end
# NoMethodError: undefined method `map' for nil:NilClass
# I know this occurs when CSV.parse(File.new(filepath).each_line.first).first returns nil

# .nil? could be useful

# test would be something like:
# expect CSV.parse(File.new(filepath).each_line.first) to equal nil
# how to fix it?
