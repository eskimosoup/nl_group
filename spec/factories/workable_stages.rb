FactoryGirl.define do
  factory :workable_stage do
    slug "slug"
    name "name"
    kind { %w( sourced applied shortlisted assessment phone-screen interview offer hired ).sample }
    position 1
    pull_candidates false
  end

end
