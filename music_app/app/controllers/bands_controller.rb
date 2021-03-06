class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end


    def show
        @band = Band.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save!
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def destroy
        @band = Band.find(params[:id])
        if Band.destroy(@band.id)
            redirect_to bands_url
        else
            render :delete
        end
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end

end
