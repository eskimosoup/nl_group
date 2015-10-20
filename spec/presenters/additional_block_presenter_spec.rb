require "rails_helper"
#  rspec --tag "additional_block"
RSpec.describe AdditionalBlockPresenter, type: :presenter, additional_content: true do
  let(:additional_block) { create(:additional_block) }
  subject(:additional_block_presenter) { AdditionalBlockPresenter.new(object: additional_block, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:additional_block) }
    it { should delegate_method(:style).to(:additional_block) }
  end

  describe "non-animated additional blocks" do
    it "returns the content wrapped in animation" do
      expect(additional_block_presenter.presented_button(0)).to eq(nil)
    end

    it "returns the html formatted paragraph content" do
      expect(additional_block_presenter.presented_paragraph).to eq(raw additional_block.additional_paragraph.content)
    end

    it "returns the title content" do
      expect(additional_block_presenter.presented_title).to eq(raw additional_block.additional_title.content)
    end
  end

  describe "animated additional blocks" do
    let(:additional_block) { create(:additional_block_with_animation) }

    it "returns the content wrapped in animation" do
      expect(additional_block_presenter.presented_button(0)).to eq(link_to additional_block.additional_buttons[0].button_text, additional_block.additional_buttons[0].button_link, title: additional_block.additional_buttons[0].button_text, data: { animation_type: additional_block.additional_buttons[0].additional_animation.animation_type, animation_delay: additional_block.additional_buttons[0].additional_animation.animation_delay })
    end

    it "returns the html formatted paragraph content" do
      expect(additional_block_presenter.presented_paragraph).to eq(raw additional_block.additional_paragraph.content)
    end

    it "returns the title content" do
      expect(additional_block_presenter.presented_title).to eq(raw additional_block.additional_title.content)
    end

    it "returns the animated block content" do
      expect(additional_block_presenter.presented_block { 'test' }).to eq(content_tag :div, (content_tag :div, 'test', {class: additional_block.classes, data: { aria_label: additional_block.name }}), { data: { animation_type: additional_block.additional_animation.animation_type, animation_delay: additional_block.additional_animation.animation_delay } })
    end
  end
end
