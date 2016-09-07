class LessonsController < ApplicationController
  def show
    @section = Section.find(params[:section_id])
    @course = @section.course
    @lesson = Lesson.find(params[:id])
    render :show
  end
  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
    render :new
  end
  def create
    @section = Section.find(params[:section_id])
    @course = @section.course
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to course_section_path(@course, @section)
    else
      render :new
    end
  end
  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    render :edit
  end
  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to section_lesson_path(@section, @lesson)
    else
      render :edit
    end
  end
  def destroy
    @section = Section.find(params[:section_id])
    @course = @section.course
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to course_section_path(@course, @section)
  end
private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number, :section_id)
  end
end
