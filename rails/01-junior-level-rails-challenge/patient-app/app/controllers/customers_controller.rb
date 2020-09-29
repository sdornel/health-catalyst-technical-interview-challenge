class CustomersController < ApplicationController
    def index
        @customers = Customer.all

    end

    def show
        @customer = Customer.find(params[:id])
        @sorted_patients = @customer.patients

        respond_to do |format|
            format.html
            format.csv { send_data Customer.to_csv(@customer.id, @sorted_patients), filename: "#{@customer.name}-#{Date.today}.csv" }
        end
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to customer_path(@customer)
    end

    private
    def customer_params
        params.require(:customer).permit(:name, :location, :partner_id)
    end
end