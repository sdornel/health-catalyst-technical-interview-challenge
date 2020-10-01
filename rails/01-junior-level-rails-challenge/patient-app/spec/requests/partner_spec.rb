require 'rails_helper'
require 'pry'

RSpec.describe Partner, type: :request do
    describe "GET partners#index" do
        it "should get index" do
            get "/partners"
            expect(response).to have_http_status(200)
        end
    end
end