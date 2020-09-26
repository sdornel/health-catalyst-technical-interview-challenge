# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'
require 'pry'

# p1 = Partner.create(id: 1)
# c1 = Customer.create(id: 1, name: "customer1", partner_id: 1)


puts "BEFORE - #{Patient.count} patient records exist"
CSV.table(Rails.root.join('db', 'seed_files', 'patients.csv')).each do |row|
  # binding.pry
  record = row.to_h.merge(date_of_birth: Date.parse(row[:date_of_birth]))
  Patient.find_or_create_by!(record)
end
puts "AFTER - #{Patient.count} patient records exist"


# input: [[1, 2], [3, 4]].to_h.merge([[:fo, :b], [99, 100]].to_h) # to hash and then merge
# output: {1=>2, 3=>4, :fo=>:b, 99=>100}



# find_or_create_by!(attributes, &block) public
# Like find_or_create_by, but calls create! so an exception is raised if the created record is invalid.

# create!(attributes = nil, &block) public
# Similar to #create, but calls {create!}[rdoc-ref:Persistence::ClassMethods#create!] on the base class. 
# Raises an exception if a validation error occurs.