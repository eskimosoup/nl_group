module Optimadmin
  class MandatoryTrainingCoursesController < Optimadmin::ApplicationController
    before_action :set_mandatory_training_course, only: [:show, :edit, :update, :destroy]

    def index
      @mandatory_training_courses = Optimadmin::BaseCollectionPresenter.new(collection: MandatoryTrainingCourse.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::MandatoryTrainingCoursePresenter)
    end

    def show
    end

    def new
      @mandatory_training_course = MandatoryTrainingCourse.new
    end

    def edit
    end

    def create
      @mandatory_training_course = MandatoryTrainingCourse.new(mandatory_training_course_params)
      if @mandatory_training_course.save
        redirect_to mandatory_training_courses_url, notice: 'Mandatory training course was successfully created.'
      else
        render :new
      end
    end

    def update
      if @mandatory_training_course.update(mandatory_training_course_params)
        redirect_to mandatory_training_courses_url, notice: 'Mandatory training course was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @mandatory_training_course.destroy
      redirect_to mandatory_training_courses_url, notice: 'Mandatory training course was successfully destroyed.'
    end

  private


    def set_mandatory_training_course
      @mandatory_training_course = MandatoryTrainingCourse.find(params[:id])
    end

    def mandatory_training_course_params
      params.require(:mandatory_training_course).permit(:name, :display)
    end
  end
end
