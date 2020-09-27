# allow create, update, and read operations on partners and customers

class PartnersController < ApplicationController
    def index
        @partners = Partner.all
    end

    def show
        @partner = Partner.find(params[:id])
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