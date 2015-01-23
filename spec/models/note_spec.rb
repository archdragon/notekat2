require "rails_helper"

describe Note do
  let(:note) { FactoryGirl.build(:note) }
  describe "#notebook_name" do
    let(:notebook) { FactoryGirl.build(:notebook) }
    it "gets the name of the parent notebook" do
      expect(note.notebook_name).to be_equal(notebook.name)
    end
  end
end