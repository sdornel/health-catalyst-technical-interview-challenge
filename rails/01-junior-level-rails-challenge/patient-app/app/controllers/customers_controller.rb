# allow create, update, and read operations on partners and customers

class CustomersController < ActionController::Base
    def index
        @customers = Customer.all
    end

    def show
        @customers = Customer.find(params[:id])
    end

    def update
        @customers = Customer.find(params[:id])
        @customers.update(customer_params)
        # redirect_to partner_path(@partner)
    end
end