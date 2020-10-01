class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])

        @patient_customer = @patient.customer
    end

end