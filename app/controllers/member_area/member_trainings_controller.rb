module MemberArea
  class MemberTrainingsController < MemberArea::BaseController

    def new
      @member_training = current_member_profile.build_member_training
    end

    def create
      @member_training = current_member_profile.build_member_training(member_training_params)
      if @member_training.save
        redirect_to member_area_member_profile_path, notice: "Training successfully saved"
      else
        render :new
      end
    end

    def edit
      @member_training = current_member_profile.member_training
    end

    def update
      @member_training = current_member_profile.member_training
      if @member_training.update(member_training_params)
        redirect_to member_area_member_profile_path, notice: "Training successfully updated"
      else
        render :edit
      end
    end

    private

    def member_training_params
      params.require(:member_training).permit(mandatory_training_course_ids: [],
                                              member_other_training_courses_attributes: [:member_training_id, :id, :title, :training_provider_name, :completed_on, :_destroy])
    end
  end
end