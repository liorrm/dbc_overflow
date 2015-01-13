require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET questions" do
    it "returns http success" do
      get :questions
      expect(response).to have_http_status(:success)
    end

    it "lists all questions on the page" do
      get :questions
      expect(last_response.body).to include("hey there!")
    end
  end

end
