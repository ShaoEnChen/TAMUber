class RequestsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_request, :only => [:show, :edit, :update, :destroy]

	def get_request
		@request = Request.find params[:id]
	end

	def request_params
		params.require(:request).permit(:name,:studentId,:startLat,:startLng,:endLat,:endLng)
	end

	def index
		@requests = Request.all
	end

	def new
	end

	def show
	end

	def create
		@request = Request.create!(request_params)
		flash[:notice] = "Request #{@request.name} was successfully created."
		redirect_to requests_path
	end

	def edit
	end

	def update
		@request.update_attributes!(request_params)
		flash[:notice] = "Request #{@request.name} was successfully updated."
		redirect_to requests_path
	end

	def destroy
		@request.destroy
		flash[:notice] = "Request #{@request.name} was successfully deleted."
		redirect_to requests_path
	end
end
