class OndutiesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	before_action :get_onduty, :only => [:show, :edit, :update, :destroy]

	def get_onduty
		@onduty = Onduty.find params[:id]
	end

	def onduty_params
		params.require(:onduty).permit(:driverName,:plateNumber,:studentName,:studentId,:vehicleLat,:vehicleLng,:startLat,:startLng,:endLat,:endLng)
	end

	def index
		@onduties = Onduty.all
	end

	def new
	end

	def show
	end

	def create
		@onduty = Onduty.create!(onduty_params)
		flash[:notice] = "Onduty #{@onduty.id} was successfully created."
		redirect_to onduties_path
	end

	def edit
	end

	def update
		@onduty.update_attributes!(onduty_params)
		flash[:notice] = "Onduty #{@onduty.id} was successfully updated."
		redirect_to onduties_path
	end

	def destroy
		@onduty.destroy
		flash[:notice] = "Onduty #{@onduty.id} was successfully deleted."
		redirect_to onduties_path
	end

	def update_car_pos
		onduty = Onduty.find_by_id(params[:id])
		att = {:vehicleLng => params[:lng], :vehicleLat => params[:lat]}
		onduty.update_attributes!(att)
	end
end
