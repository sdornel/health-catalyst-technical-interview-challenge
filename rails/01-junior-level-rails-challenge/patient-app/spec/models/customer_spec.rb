require 'rails_helper'
require 'pry'

RSpec.describe Customer, type: :model do
let(:customer) { subject }

    it "should have an id" do
        @customer = Customer.new
        expect(@customer.id).to eq(nil)
    end

    it "has a name" do
        @customer = Customer.new
        @customer.name = "Joe Burgess"
        expect(@customer.name).to eq("Joe Burgess")
    end

    it "has a location" do
        @customer = Customer.new
        @customer.location = "DC"
        expect(@customer.location).to eq("DC")
    end

    it 'has many patients' do
        patient = Patient.create

        customer.patients << patient
        customer.save

        expect(customer.patients).to include(patient)
    end

    it 'belongs to a partner' do
        partner = Partner.create

        partner.customers << customer
        customer.save

        expect(partner.customers).to include(customer)
    end
end
