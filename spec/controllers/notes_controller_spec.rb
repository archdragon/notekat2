require "rails_helper"

RSpec.describe NotesController, :type => :controller do
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  before(:each) do
    @user = FactoryGirl.create(:user_with_notebooks)
    sign_in @user
  end

  describe "POST #create" do
    let(:request) { -> { post :create, notebook_id: @user.notebooks.first, note: FactoryGirl.attributes_for(:note) } }
    it "saves the new note in the database" do
      expect(request).to change(Note, :count).by(1) 
    end
    it "redirects to the notebook page" do
      request.call
      expect(response).to redirect_to @user.notebooks.first
    end
  end

end