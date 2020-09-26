# allow create, update, and read operations on partners and customers

class PartnersController < ActionController::Base
    def index
        @partners = Partner.all
    end

    def show
        @partner = Partner.find(params[:id])
    end

    def update
        @partner = Partner.find(params[:id])
        @partner.update(partner_params)
        # redirect_to partner_path(@partner)
    end
end