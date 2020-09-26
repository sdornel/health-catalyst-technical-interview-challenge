# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'
require 'pry'

# TODO: UPDATE SEEDS.RB AND CREATE CUSTOMER AND PARTNER CSV FILES

num_partners = 5 # represents partners who work with health catalyst
num_customers = 100 # represents customers who work with health catalyst

partner = 0 
puts "BEFORE - #{Partner.count} partner records exist"
while partner < num_partners do
  # data = {:id=>partner, :name=>"partner_#{partner}", :location=>"partner_location_#{partner}"}
  # Partner.find_or_create_by(data)

  Partner.create(name: "partner_#{partner+1}", location: "partner_location_#{partner+1}")
  partner += 1
end
puts "AFTER - #{Partner.count} partner records exist"

customer = 0
puts "BEFORE - #{Customer.count} customer records exist"
while customer < num_customers do # for the sake of simplicity I assumed each partner has an equal number of customers
  customer_id = customer + 1000
  if customer < 20
    partner = 1
  elsif customer < 40
    partner = 2
  elsif customer < 60
    partner = 3
  elsif customer < 80
    partner = 4
  else
    partner = 5
  end

  Customer.create(id: customer_id, partner_id: partner, name: "customer_#{customer+1}", location: "customer_location_#{customer+1}")
  customer += 1
end
# binding.pry
puts "AFTER - #{Customer.count} customer records exist"

puts "BEFORE - #{Patient.count} patient records exist"
CSV.table(Rails.root.join('db', 'seed_files', 'patients.csv')).each do |row|
  # customer_id = row[:customer_external_id]
  # record = row.to_h.merge(date_of_birth: Date.parse(row[:date_of_birth]))
  # binding.pry
  # Customer.find_or_create_by!(row[:customer_external_id])
  
  record = {:given_name=>row[:given_name], :family_name=>row[:family_name], :phone_number=>row[:phone_number], :sex=>row[:sex], :external_id=>row[:external_id], :customer_id=>row[:customer_external_id]}
  Patient.find_or_create_by!(record)
  # puts record
  # Patient.create(record)
end
puts "AFTER - #{Patient.count} patient records exist"


# input: [[1, 2], [3, 4]].to_h.merge([[:fo, :b], [99, 100]].to_h) # to hash and then merge
# output: {1=>2, 3=>4, :fo=>:b, 99=>100}



# find_or_create_by!(attributes, &block) public
# Like find_or_create_by, but calls create! so an exception is raised if the created record is invalid.

# create!(attributes = nil, &block) public
# Similar to #create, but calls {create!}[rdoc-ref:Persistence::ClassMethods#create!] on the base class. 
# Raises an exception if a validation error occurs.