class CreateMandatoryTrainingCourses < ActiveRecord::Migration
  def change
    create_table :mandatory_training_courses do |t|
      t.string :name, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
