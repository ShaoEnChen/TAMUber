class AdministratorsController < ApplicationController
	before_action :get_administrator, :only => [:show, :edit, :update, :destroy]

	def get_administrator
		@administrator = Administrator.find params[:id]
	end

	def administrator_params
		params.require(:administrator).permit(:name, :account, :password)
	end

	def index
		@administrators = Administrator.all
	end

	def new
	end

	def show
	end

	def create
		@administrator = Administrator.create!(administrator_params)
		flash[:notice] = "Administrator #{@administrator.name} was successfully created."
		redirect_to administrators_path
	end

	def edit
		@administrator = Administrator.find params[:id]
	end

	def update
		@administrator.update_attributes!(administrator_params)
		flash[:notice] = "Administrator #{@administrator.name} was successfully updated."
		redirect_to administrators_path
	end

	def destroy
		@administrator.destroy
		flash[:notice] = "Administrator #{@administrator.name} was successfully deleted."
		redirect_to administrators_path
	end
end
