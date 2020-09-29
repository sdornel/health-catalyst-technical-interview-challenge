require 'rails_helper'
require 'pry'

RSpec.describe Partner, type: :model do
    let(:partner) { subject }

    it "should have an id" do
        @partner = Partner.new
        expect(@partner.id).to eq(nil)
    end

    it "has a name" do
        @partner = Partner.new
        @partner.name = "Joe Burgess"
        expect(@partner.name).to eq("Joe Burgess")
    end

    it "has a location" do
        @partner = Partner.new
        @partner.location = "DC"
        expect(@partner.location).to eq("DC")
    end

    it 'has many customers' do
        customer = Customer.create
    
        partner.customers << customer
        partner.save
    
        expect(customer.partner).to eq(partner)
    end

    it 'has many patients through customers' do 
        customer = Customer.create
        patient = Patient.create

        customer.patients << patient
        customer.save
        partner.customers << customer
        partner.save
    
        expect(partner.customers.first.patients).to include(patient)
    end

end

RSpec.describe Partner, type: :request do
        describe "GET partners#index" do
        it "should get index" do
            get "/partners"
            expect(response).to have_http_status(200)
        end
    end
    
end