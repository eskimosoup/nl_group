require "rails_helper"

RSpec.describe BaseCollectionPresenter, type: :presenter do
  describe "1 team member" do
    let(:team_members) { build_list(:team_member, 1)}
    subject(:collection_presenter){ BaseCollectionPresenter.new(collection: team_members, view_template: view,
                                                                presenter: TeamMemberPresenter)}
    it "should return only one team member" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [1])
      expect(split_array).to eq([[collection_presenter.presented_collection.first]])
    end
  end

  describe "2 team members" do
    let(:team_members) { build_list(:team_member, 2)}
    subject(:collection_presenter){ BaseCollectionPresenter.new(collection: team_members, view_template: view,
                                                                presenter: TeamMemberPresenter)}
    it "should return an array with an array of the 2 team members" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [2])
      expect(split_array).to eq([collection_presenter.presented_collection[0,2]])
    end

    it "should return an array with an 2 arrays of one team member" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [1, 1])
      expect(split_array).to eq([[collection_presenter.presented_collection[0]], [collection_presenter.presented_collection[1]]])
    end

    it "should ignore extra requested arrays if there are no more elements in array" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [1, 1, 1])
      expect(split_array).to eq([ [collection_presenter.presented_collection[0]], [collection_presenter.presented_collection[1]]])
    end
  end

  describe "3 team members" do
    let(:team_members) { build_list(:team_member, 3)}
    subject(:collection_presenter){ BaseCollectionPresenter.new(collection: team_members, view_template: view,
                                                                presenter: TeamMemberPresenter)}

    it "should ignore unnecessary team_members" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [2])
      expect(split_array).to eq([collection_presenter.presented_collection[0,2]])
    end
  end

  describe "18 team members" do
    let(:team_members) { build_list(:team_member, 19)}
    subject(:collection_presenter){ BaseCollectionPresenter.new(collection: team_members, view_template: view,
                                                                presenter: TeamMemberPresenter)}

    it "should work with 19 team members" do
      split_array = collection_presenter.split_array(collection_presenter.presented_collection, [5,2,4,4,3,1])
      expect(split_array).to eq([collection_presenter.presented_collection[0,5],
                                 collection_presenter.presented_collection[5,2],
                                 collection_presenter.presented_collection[7,4],
                                 collection_presenter.presented_collection[11,4],
                                 collection_presenter.presented_collection[15,3],
                                 collection_presenter.presented_collection[18,1]
                                ])
    end
  end

end