module Optimadmin
  class WorkableStagePresenter < Optimadmin::BasePresenter
    presents :workable_stage
    delegate :id, to: :workable_stage

    def name
      workable_stage.name
    end

    def slug
      workable_stage.slug
    end

    def kind
      workable_stage.kind
    end

    def toggle_pull_candidates
      toggle_link(:pull_candidates)
    end
  end
end
