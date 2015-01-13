require 'rails_helper'

# assert: generated instance variables

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq Question.all # assigns method is rails-specific
    end


  end
end
