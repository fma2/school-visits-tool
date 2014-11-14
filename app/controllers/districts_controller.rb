class DistrictsController < ApplicationController
  before_action :set_district, only: [:show]

  # GET /districts
  # GET /districts.json
  def index
    @districts = District.all
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    @schools = @district.schools
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params[:district]
    end
end
