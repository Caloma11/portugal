class RealtiesController < ApplicationController

  before_action :set_realty, only: [:show, :edit, :update, :destroy]


def index
  @realties = Realty.all
end

def show

end

def new
  @realty = Realty.new
end

def create
  @realty = Realty.new(realty_params)
  @realty.save
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realty
      @realty = Realty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realty_params
      params.require(:realty).permit(:title, :description, :subtitle, :price, :rooms, :area, :price_per_meter, :main_image, :characs, :secondary_images)
    end

end



