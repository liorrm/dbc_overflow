class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end