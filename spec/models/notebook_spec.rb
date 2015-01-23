require "rails_helper"

describe Notebook do
  let(:invalid_notebook) { FactoryGirl.build(:invalid_notebook) }
  it "requires a valid name" do
    expect(invalid_notebook).to_not be_valid
  end
end