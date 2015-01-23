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

    context "after many updates" do
      let(:updateable_note) {FactoryGirl.build(:note)}
      let(:number_of_saves) { 2 + rand(6) }

      before do
        (1..number_of_saves).each do |number|
          updateable_note.text = 'TEXT_' + String(number)
          updateable_note.save
        end
      end

      it "old versions will be saved by the PaperTrail gem" do
         expect(updateable_note.versions.size).to eq(number_of_saves)
      end
    end
  end

end