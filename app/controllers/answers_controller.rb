class AnswersController < ApplicationController

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.votes.create(direction: :up)
    redirect_to :root
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.votes.create(direction: :down)
    redirect_to :root
  end

  def create
    @question = Question.find(params[:question_id])
    answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
    upvotes = answer.votes.where(direction: :up).count
    downvotes = answer.votes.where(direction: :down).count
    @votes = upvotes - downvotes
  end

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end