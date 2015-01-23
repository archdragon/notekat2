require "rails_helper"

describe Version do
  let(:version) { FactoryGirl.build(:version) }
  describe "#starts_at" do
    it "is equal to the creation date" do
      expect(version.starts_at).to be_equal(version.created_at)
    end
  end
end