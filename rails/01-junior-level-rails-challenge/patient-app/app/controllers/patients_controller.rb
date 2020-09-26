class PatientsController < ActionController::Base

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        # redirect_to patient_path(@patient)
    end

end