
class ExportsController < ApplicationController

    def index
        @exports = Export.all
    end

    def show
        @export = Export.find(params[:id])
    end

    # def new
    #     @export = Export.new
    # end

    # def create
    #     byebug
    #     @export = Export.create(export_params)
    #     redirect_to export_path(@export)
    # end

end