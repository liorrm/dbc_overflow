require 'rails_helper'

RSpec.describe Question, :type => :model do

  describe "Question model" do

    context "With All Attributes Given" do

      it "creates a new question" do
        question = FactoryGirl.build(:question)
        expect(question).to be_valid
      end

      it "saves a new question to database" do
        question = FactoryGirl.build(:question)
        expect { question.save }.to change { Question.count }.by(1)
      end
    end

    context "With Some or No Attributes Given" do

      it "doesn't save a new question when validations not met" do
        question = FactoryGirl.build(:question, title: nil)
        expect { question.save }.to_not change { Question.count }
      end

      it "generates error message(s) when validations not met" do
        question = FactoryGirl.build(:question, title: nil)
        question.save
        expect(question.errors.full_messages).to_not be_empty
      end

      it "generates the correct error message for invalid title" do
        question = FactoryGirl.build(:question, title: nil)
        question.save
        expect(question.errors.full_messages.count).to eql(1)
        expect(question.errors.full_messages[0]).to include("Title can't be blank")
      end

      it "generates the correct error message for invalid content" do
        question = FactoryGirl.build(:question, content: nil)
        question.save
        expect(question.errors.full_messages.count).to eql(1)
        expect(question.errors.full_messages[0]).to include("Content can't be blank")
      end
    end
  end
end
