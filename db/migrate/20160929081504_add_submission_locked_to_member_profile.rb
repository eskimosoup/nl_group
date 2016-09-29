class AddSubmissionLockedToMemberProfile < ActiveRecord::Migration
  def change
    add_column :member_profiles, :submission_locked, :boolean,
               default: false, null: true
  end
end
