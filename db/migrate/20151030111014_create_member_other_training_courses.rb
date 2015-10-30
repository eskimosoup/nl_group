class CreateMemberOtherTrainingCourses < ActiveRecord::Migration
  def change
    create_table :member_other_training_courses do |t|
      t.belongs_to :member_training, index: true, foreign_key: { on_delete: :cascade }
      t.string :title, null: false
      t.string :training_provider_name, null: false
      t.date :completed_on, null: false

      t.timestamps null: false
    end
  end
end
