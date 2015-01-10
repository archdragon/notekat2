require "rails_helper"

RSpec.describe NotesController, :type => :controller do
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before(:each) do
    @user = FactoryGirl.create(:user_with_notebooks)
    sign_in @user
  end

  shared_examples "a taggable note" do
    context "if the note contains hashtags" do
      let(:hashtag_count) { [*1..10].sample }
      it "adds the tags" do
        note_with_hashtags = FactoryGirl.build(:note_with_hashtags, :hashtag_count => hashtag_count)
        case http_method
        when :update
          # TODO
        else
          post :create, notebook_id: @user.notebooks.first, note: note_with_hashtags.attributes.symbolize_keys 
        end
        expect(Note.last.tag_counts_on(:tags).length).to eq(hashtag_count)
      end
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:request) { -> { post :create, notebook_id: @user.notebooks.first, note: FactoryGirl.attributes_for(:note) } }
      it "saves the new note in the database" do
        expect(request).to change(Note, :count).by(1) 
      end
      it "redirects to the notebook page" do
        request.call
        expect(response).to redirect_to @user.notebooks.first
      end

      it_behaves_like "a taggable note" do 
        let(:http_method) { :post }
      end

      context "when there is a problem saving a note" do
        before { allow_any_instance_of(Note).to receive(:save) }
        it "redirects to the front page" do
          request.call
          expect(response).to redirect_to root_path
        end
      end
    end
  end

end