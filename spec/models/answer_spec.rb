require 'rails_helper'

RSpec.describe Answer, :type => :model do

    describe "Answer model" do

    it "creates a new answer" do
      answer = FactoryGirl.build(:answer)
      expect(answer).to be_valid
    end

    it "saves a new answer to database when fields given" do
      answer = FactoryGirl.build(:answer)
      expect { answer.save }.to change { Answer.count }.by(1)
    end

    it "doesn't save a new answer when validations not met" do
      answer = FactoryGirl.build(:answer, title: nil)
      expect { answer.save }.to_not change { Answer.count }
    end

    it "generates error message(s) when validations not met" do
      answer = FactoryGirl.build(:answer, title: nil)
      answer.save
      expect(answer.errors.full_messages).to_not be_empty
    end

    it "generates the correct error message" do
      answer = FactoryGirl.build(:answer, title: nil)
      answer.save
      expect(answer.errors.full_messages.count).to eql(1)
      expect(answer.errors.full_messages[0]).to include("Title can't be blank")
    end

  end



  #     expect { Answer.create(title: "You are a bad programmer", content: "please be a barista isntead")}.to change { Answer.count }.by(1)
  #   end

  #   it "creates a new question with given params" do
  #     question = Answer.create(title: "Hey there", content: "whats going on?")
  #     expect(question.title).to eql("Hey there")
  #   end

  # end

end
