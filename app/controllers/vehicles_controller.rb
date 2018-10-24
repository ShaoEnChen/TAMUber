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
		id = params[:id] # retrieve movie ID from URI route
    	@vehicle = Vehicle.find(id) # look up mov ie by unique ID
	end

	def create
		@vehicle = Vehicle.create!(vehicle_params)
		flash[:notice] = "Vehicle #{@vehicle.name} was successfully created."
		redirect_to vehicles_path
	end

	def edit
		@movie = Vehicle.find params[:id]
	end

	def update
		@vehicle = Vehicle.find params[:id]
		@vehicle.update_attributes!(vehicle_params)
		flash[:notice] = "Vehicle #{@vehicle.name} was successfully updated."
		redirect_to vehicles_path
	end

	def destroy
		@vehicle.destroy
		flash[:notice] = "Vehicle #{@vehicle.name} was successfully deleted."
		redirect_to vehicles_path
	end
end
