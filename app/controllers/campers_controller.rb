class CampersController < ApplicationController
  def index
    render json: Camper.all, status: :ok
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, status: :ok, serializer: CampersActivitiesSerializer
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "Camper not found"}, status: :not_found
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

end
