class CustomerController < ActionController::Base

    def index
        @patients = Patients.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

end