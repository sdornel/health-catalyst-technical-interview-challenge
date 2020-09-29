require 'rails_helper'

RSpec.describe Patient, type: :request do
  describe "GET patients#index" do
    it "should get index" do
      get "/patients"
      expect(response).to have_http_status(200)
    end
  end

end

