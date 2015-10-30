class CreateMemberTrainings < ActiveRecord::Migration
  def change
    create_table :member_trainings do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
