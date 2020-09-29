require 'rails_helper'
require 'pry'

RSpec.describe Partner, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"

it "creates expected csv" do 
    allow(described_class).to receive(:all).and_return([
      described_class.new(id: "id")
    #   described_class.new(given_name: "testing patient given name")
    ])
    binding.pry
    test_patient = { id: 1, date_of_birth: "1948-01-05", given_name: "Simone", family_name: "Bella", phone_number: "(555) 555-5555", sex: "F", external_id: "Simone-Bella", customer_id: 1000, customer_external_id: 1000, created_at: "2020-09-29 14:48:20", updated_at: "2020-09-29 14:48:20" }

    expect(described_class.to_csv(1, test_patient)).to eq "title\ntitle1\ntitle2\n"
end



    # let(:header) { "column1, column2, column3, column4, column5, column6, column7, column8" }
    # let(:row2) { "value1, value2, value3, value4, value5, value6, value7, value8" }
    # let(:row3) { "value1, value2, value3, value4, value5, value6, value7, value8" }
    # let(:rows) { [header, row2, row3] }

    # context "with missing row data" do
    #     let(:row2) { "value1, value2" }
    # end

    # let(:file_path) { "tmp/test.csv" }
    # let!(:csv) do
    #     CSV.open(file_path, "w") do |csv|
    #         rows.each do |row|
    #         csv << row.split(",")
    #         end
    #     end
    # end

    # subject { Csv::Partner.new(file_path) }

    # after(:each) { File.delete(file_path) }

end
