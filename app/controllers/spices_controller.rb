class SpicesController < ApplicationController
      # GET /spices
    def index
        spice = Spice.all
        render json: spice
    end
    # POST /spices
    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end
    # PATCH /spices/id
    def update
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.update(spice_params)
            render json: spices, status: :accepted
        else
            render json: {error: "spices not found"}, status: :not_found
        end
    end
    # DELETE /spices/id
    def destroy
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.destroy
            head :no_content
        else
            render json: {error: "spices not found"}, status: :no_content
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end

