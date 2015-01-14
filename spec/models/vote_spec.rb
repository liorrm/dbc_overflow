require 'rails_helper'

RSpec.describe Vote, :type => :model do

  context "Question Upvote" do

    it "creates a new upvote" do
      vote = FactoryGirl.build(:vote)
      expect(vote).to be_valid
    end

    it "creates a new upvote with the right association" do
      question = FactoryGirl.create(:question)
      vote = question.votes.create(direction: :up)
      expect(question.id).to eql(vote.votable_id)
    end

  end

  context "Question Downvote" do

    it "creates a new downvote" do
      vote = FactoryGirl.build(:vote, direction: "down")
      expect(vote).to be_valid
    end

    it "creates a new downvote with the right association" do
      question = FactoryGirl.create(:question)
      vote = question.votes.create(direction: :down)
      expect(question.id).to eql(vote.votable_id)
    end

  end

  context "Answer Upvote" do

    it "creates a new upvote" do
      vote = FactoryGirl.build(:vote)
      expect(vote).to be_valid
    end

    it "creates a new upvote with the right association" do
      answer = FactoryGirl.create(:answer)
      vote = answer.votes.create(direction: :up)
      expect(answer.id).to eql(vote.votable_id)
    end

  end

  context "Answer Downvote" do

    it "creates a new downvote" do
      vote = FactoryGirl.build(:vote, direction: "down")
      expect(vote).to be_valid
    end

    it "creates a new downvote with the right association" do
      answer = FactoryGirl.create(:answer)
      vote = answer.votes.create(direction: :down)
      expect(answer.id).to eql(vote.votable_id)
    end

  end

end
