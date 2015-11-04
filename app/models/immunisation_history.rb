class ImmunisationHistory < ActiveRecord::Base
  belongs_to :member_profile

  validates :triple_vaccination_date, presence: true, if: Proc.new{|x| x.had_triple_vaccination? }
  validates :polio_vaccination_date, presence: true, if: Proc.new{|x| x.had_polio_vaccination? }
  validates :hepatitis_b_vaccination_date, presence: true, if: Proc.new{|x| x.had_hepatitis_b_vaccination? }
  validates :had_triple_vaccination, :had_polio_vaccination, :had_hepatitis_b_vaccination, :role_involves_epps, inclusion: { in: [true, false] }
end
