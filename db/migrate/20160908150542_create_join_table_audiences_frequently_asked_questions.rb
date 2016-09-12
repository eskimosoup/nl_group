class CreateJoinTableAudiencesFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_join_table :audiences, :frequently_asked_questions do |t|
      t.index [:audience_id, :frequently_asked_question_id], name: 'aud_faq'
      t.index [:frequently_asked_question_id, :audience_id], name: 'faq_aud'
    end
  end
end
