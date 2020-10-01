class PartnersController < ApplicationController
    def index
        @partners = Partner.all
    end

    def show
        @partner = Partner.find(params[:id])

        @sorted_patients = @partner.patients
        respond_to do |format|
            format.html
            format.csv { send_data Partner.to_csv(@partner.id, @sorted_patients), filename: "#{@partner.name}-patients-#{Date.today}.csv" }
        end
    end

    def edit
        @partner = Partner.find(params[:id])
    end

    def update
        @partner = Partner.find(params[:id])
        @partner.update(partner_params)
        redirect_to partner_path(@partner)
    end

    private
    def partner_params
        params.require(:partner).permit(:name, :location)
    end
end