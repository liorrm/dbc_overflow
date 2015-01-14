require 'rails_helper'

# assert: generated instance variables

RSpec.describe QuestionsController, :type => :controller do

  context "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq Question.all # assigns method is rails-specific
    end
  end

  context "POST #create" do

  it "creates a question if params are valid" do
    question_params = FactoryGirl.attributes_for :question
    expect {
      post :create, :question => question_params
    }.to change { Question.count }.by(1)
  end

  it "doesn't create a question if params are invalid" do
    question_params = FactoryGirl.attributes_for :question
    question_params.delete(:title)
    expect {
      post :create, :question => question_params
    }.to_not change { Question.count }
  end

  it "redirects to root if successful" do
    question_params = FactoryGirl.attributes_for :question
    expect {
      post :create, :question => question_params
    }.to change { Question.count }.by(1)
  end

end


end
