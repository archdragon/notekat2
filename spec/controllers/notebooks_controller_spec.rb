require "rails_helper"

RSpec.describe NotebooksController, :type => :controller do
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  before(:each) do
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

  describe "POST #create" do
    context "with valid attributes" do 
      let(:request) { -> { post :create, notebook: FactoryGirl.attributes_for(:notebook) } }
      it "saves the new notebook in the database" do
        expect(request).to change(Notebook, :count).by(1) 
      end
      it "redirects to the notebook page" do
        request.call
        expect(response).to redirect_to Notebook.last
      end
    end

    context "with invalid attributes" do
      let(:request) { -> { post :create, notebook: FactoryGirl.attributes_for(:invalid_notebook) } }
      it "does not save the new notebook in the database" do
        expect(request).to_not change(Notebook, :count) 
      end
      it "redirects to the home page" do
        request.call
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "DELETE #{}destroy" do
    subject { @user.notebooks.first }
    it "deletes the notebook" do
      expect {
        delete :destroy, id: subject
      }.to change(Notebook, :count).by(-1)
    end
  end
end