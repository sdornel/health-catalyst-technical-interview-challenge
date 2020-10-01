require 'rails_helper'

RSpec.describe Customer, type: :request do
    
    describe "GET customers#index" do
        it "should get index" do
            get "/customers"
            expect(response).to have_http_status(200)
        end
    end
end