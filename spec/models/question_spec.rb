require 'rails_helper'

RSpec.describe Question, :type => :model do

  describe "Question model" do

    it "creates a new question" do
      expect { Question.create(title: "Hey there", content: "whats going on?")}.to change { Question.count }.by(1)
    end

    it "creates a new question with given params" do
      question = Question.create(title: "Hey there", content: "whats going on?")
      expect(question.title).to eql("Hey there")
    end

  end

end
