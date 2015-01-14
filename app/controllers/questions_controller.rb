class QuestionsController < ApplicationController

  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(direction: :up)
    redirect_to :root
  end

  def downvote
    @question = Question.find(params[:id])
    @question.votes.create(direction: :down)
    redirect_to :root
  end

  def index ## get '/(questions)/' do
    @questions = Question.all
  end

  def show ## get '/questions/:id' do
    @question = Question.find(params[:id])
    upvotes = @question.votes.where(direction: :up).count
    downvotes = @question.votes.where(direction: :down).count
    @votes = upvotes - downvotes
    @question.answers
  end

  def new
    @question = Question.new
  end

  def create ## post '/questions' do
    @question = Question.new(question_params)
    if @question.save
      redirect_to :root
    else
      render 'edit'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  @question = Question.find(params[:id])

  if @question.update(question_params)
    redirect_to @question
  else
    render 'edit'
  end
end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :root
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
