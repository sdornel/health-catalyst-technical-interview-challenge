class PatientsController < ApplicationController

    def index
        @patients = Patient.all

        respond_to do |format|
            format.html
            format.csv { send_data @patients.to_csv, filename: "patients-#{Date.today}.csv" }
        end
    end

    def show
        @patient = Patient.find(params[:id])
    end

end