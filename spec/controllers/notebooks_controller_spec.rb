require "rails_helper"

RSpec.describe NotebooksController, :type => :controller do
  before(:each) do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user_with_notebooks)
    sign_in @user
  end

  describe "GET #show" do
    let(:notebook) { @user.notebooks.first }

    before do
      get :show, :id => notebook.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "loads all the notes from the current notebook" do
      expect(assigns(:notes).size).to eq notebook.notes.size
    end
  end
end