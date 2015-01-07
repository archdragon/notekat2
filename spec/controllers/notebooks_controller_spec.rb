require "rails_helper"

RSpec.describe NotebooksController, :type => :controller do  
  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]    
  end

  before(:each) do 
    @user = FactoryGirl.create(:user_with_notebooks)
    sign_in @user
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => @user.notebooks.first.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, :id => @user.notebooks.first.id
      expect(response).to render_template("show")
    end

    it "loads the @notes from the current notebook" do

    end
  end
end