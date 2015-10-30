class CreateMemberMandatoryTrainings < ActiveRecord::Migration
  def change
    create_table :member_mandatory_trainings do |t|
      t.belongs_to :member_training, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :mandatory_training_course, index: { name: "member_mandatory_training" }, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
