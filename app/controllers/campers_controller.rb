class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index 
        campers = Camper.all 
        render json: campers
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    private 

    def record_not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def camper_params 
        params.permit(:name, :age)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end

end
