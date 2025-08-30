class StudentsController < ApplicationController
  def index
    @students = if params[:query].present?
                  Student.search(params[:query])
                else
                  Student.all
                end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render "new"
    end
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
