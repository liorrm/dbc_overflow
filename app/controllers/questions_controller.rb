class QuestionsController < ApplicationController

  def index ## get '/(questions)/' do
    @questions = Question.all
  end

  def show ## get '/questions/:id' do
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create ## post '/questions' do
    @question = Question.new(question_params)
    if @question.save
      redirect_to :root
    else
      "poop"
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def question_params
      params.require(:question).permit(:title, :content)
    end



end
