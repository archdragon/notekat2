require "rails_helper"

describe Note do
  let(:note) { FactoryGirl.build(:note) }
  describe "#notebook_name" do
    let(:notebook) { FactoryGirl.build(:notebook) }
    it "gets the name of the parent notebook" do
      expect(note.notebook_name).to be_equal(notebook.name)
    end
  end

  with_versioning do
    it "saves old versions using the PaperTrails gem" do
      expect(PaperTrail).to be_enabled
    end

    context "after update" do
      let(:updateable_note) {FactoryGirl.build(:note)}
      before do
        (1..3).each do |number|
          updateable_note.text = 'TEXT_' + String(number)
          updateable_note.save
        end
      end

      it "saves old versions" do
         # expect(updateable_note).to have_a_version_with :text => 'TEXT_1'
         # expect(updateable_note).to have_a_version_with :text => 'TEXT_2'
      end
    end
  end

end