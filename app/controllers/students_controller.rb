class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_student, :only => [:show, :edit, :update, :destroy]
  
  def get_student
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    flash[:notice] = "Student #{@student.name} was successfully created."
    redirect_to students_path
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student.update_attributes!(student_params)
    flash[:notice] = "Student #{@student.name} was successfully updated."
    redirect_to students_path
  end

  def destroy
    @student.destroy
    flash[:notice] = "Student #{@student.name} was successfully deleted."
    redirect_to students_path
  end

  private
 
  def student_params
    params.require(:student).permit(:name, :studentId, :startLat, :startLng, :endLat, :endLng)
  end

end
