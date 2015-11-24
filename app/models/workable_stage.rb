class WorkableStage < ActiveRecord::Base
  scope :pull_candidates, ->{ where(pull_candidates: true) }
end
