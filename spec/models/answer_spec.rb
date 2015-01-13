require 'rails_helper'

RSpec.describe Answer, :type => :model do

  describe "Answer model" do

    context "With All Attributes Given" do

      it "creates a new answer" do
        answer = FactoryGirl.build(:answer)
        expect(answer).to be_valid
      end

      it "saves a new answer to database" do
        answer = FactoryGirl.build(:answer)
        expect { answer.save }.to change { Answer.count }.by(1)
      end

    end

    context "With Some or No Attributes Given" do

      it "doesn't save a new answer when validations not met" do
        answer = FactoryGirl.build(:answer, title: nil)
        expect { answer.save }.to_not change { Answer.count }
      end

      it "generates error message(s) when validations not met" do
        answer = FactoryGirl.build(:answer, title: nil)
        answer.save
        expect(answer.errors.full_messages).to_not be_empty
      end

      it "generates the correct error message for invalid title" do
        answer = FactoryGirl.build(:answer, title: nil)
        answer.save
        expect(answer.errors.full_messages.count).to eql(1)
        expect(answer.errors.full_messages[0]).to include("Title can't be blank")
      end

      it "generates the correct error message for invalid content" do
        answer = FactoryGirl.build(:answer, content: nil)
        answer.save
        expect(answer.errors.full_messages.count).to eql(1)
        expect(answer.errors.full_messages[0]).to include("Content can't be blank")
      end
    end
  end
end
