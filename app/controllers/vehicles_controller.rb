class VehiclesController < ApplicationController
	before_action :get_vehicle, :only => [:show, :edit, :update, :destroy]

	def get_vehicle
		@vehicle = Vehicle.find params[:id]
	end

	def vehicle_params
		params.require(:vehicle).permit(:name)
	end

	def index
		@vehicles = Vehicle.all
	end

	def new
	end

	def show
	end

	def create
		@vehicle = Vehicle.create!(vehicle_params)
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully created."
		redirect_to vehicles_path
	end

	def edit
	end

	def update
		@vehicle.update_attributes!(vehicle_params)
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully updated."
		redirect_to vehicles_path
	end

	def destroy
		@vehicle.destroy
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully deleted."
		redirect_to vehicles_path
	end
end
