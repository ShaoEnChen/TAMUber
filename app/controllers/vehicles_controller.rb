class VehiclesController < ApplicationController
	def vehicle_params
		params.permit(:name)
	end

	def index
		@vehicles = Vehicle.all
	end

	def new
		# default: render 'new' template
	end

	def show
		@vehicle = Vehicle.find params[:id]
	end

	def create
		@vehicle = Vehicle.create! vehicle_params
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully created."
		redirect_to vehicles_path
	end

	def edit
		@vehicle = Vehicle.find params[:id]
	end

	def update
		@vehicle = Vehicle.find params[:id]
		@vehicle.update_attributes! vehicle_params
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully updated."
		redirect_to vehicles_path
	end

	def destroy
		@vehicle = Vehicle.find params[:id]
		@vehicle.destroy
		flash[:notice] = "Vehicle #{@vehicle.id} was successfully deleted."
		redirect_to vehicles_path
	end
end
