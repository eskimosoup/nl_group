require "rails_helper"

describe Optimadmin::AvailableRolesController, type: :controller, available_role: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Available role is valid" do
      it "redirects to index on normal save" do
        available_role = stub_valid_available_role

        post :create, commit: "Save", available_role: available_role.attributes

        expect(response).to redirect_to(available_roles_path)
        expect(flash[:notice]).to eq("Available role was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        available_role = stub_valid_available_role

        post :create, commit: "Save and continue editing", available_role: available_role.attributes

        expect(response).to redirect_to(edit_available_role_path(available_role))
        expect(flash[:notice]).to eq("Available role was successfully created.")
      end
    end

    context "when Available role is invalid" do
      it "renders the edit template" do
        available_role = stub_invalid_available_role

        post :create, commit: "Save", available_role: available_role.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Available role is valid" do
      it "redirects to index on normal save" do
        available_role = stub_valid_available_role

        patch :update, id: available_role.id, commit: "Save", available_role: available_role.attributes

        expect(response).to redirect_to(available_roles_path)
        expect(flash[:notice]).to eq("Available role was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        available_role = stub_valid_available_role

        patch :update, id: available_role.id, commit: "Save and continue editing", available_role: available_role.attributes

        expect(response).to redirect_to(edit_available_role_path(available_role))
        expect(flash[:notice]).to eq("Available role was successfully updated.")
      end
    end

    context "when Available role is invalid" do
      it "renders the edit template" do
        available_role = stub_invalid_available_role

        patch :update, id: available_role.id, commit: "Save", available_role: available_role.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_available_role
    available_role = build_stubbed(:available_role)
    allow(AvailableRole).to receive(:new).and_return(available_role)
    allow(available_role).to receive(:save).and_return(true)
    allow(AvailableRole).to receive(:find).and_return(available_role)
    allow(available_role).to receive(:update).and_return(true)
    available_role
  end

  def stub_invalid_available_role
    available_role = build_stubbed(:available_role)
    allow(AvailableRole).to receive(:new).and_return(available_role)
    allow(available_role).to receive(:save).and_return(false)
    allow(AvailableRole).to receive(:find).and_return(available_role)
    allow(available_role).to receive(:update).and_return(false)
    available_role
  end
end
