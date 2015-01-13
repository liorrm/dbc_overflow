require 'rails_helper'

RSpec.describe Answer, :type => :model do

    describe "Answer model" do

    it "creates a new question" do
      expect { Answer.create(title: "You are a bad programmer", content: "please be a barista isntead")}.to change { Answer.count }.by(1)
    end

    it "creates a new question with given params" do
      question = Answer.create(title: "Hey there", content: "whats going on?")
      expect(question.title).to eql("Hey there")
    end

  end

end
