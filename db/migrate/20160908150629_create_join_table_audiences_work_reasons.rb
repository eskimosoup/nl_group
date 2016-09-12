class CreateJoinTableAudiencesWorkReasons < ActiveRecord::Migration
  def change
    create_join_table :audiences, :work_reasons do |t|
      t.index [:audience_id, :work_reason_id]
      t.index [:work_reason_id, :audience_id]
    end
  end
end
