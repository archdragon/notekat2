require "rails_helper"

describe PagesController, :type => :controller do  
  setup do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET #index" do

    context "if not logged in" do
      before { get :index }
      it "renders index template" do
        expect(response).to render_template("index")
      end
    end

    context "if user is signed in" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
        get :index
      end
      context "if user doesn't have any notebooks" do
        it "creates the first notebook" do
          expect(assigns(:notebooks).size).to eq 1
        end
      end
      it "redirects to the first notebook" do
        expect(response).to redirect_to notebook_path(assigns(:notebooks).first)
      end
    end
  end

end