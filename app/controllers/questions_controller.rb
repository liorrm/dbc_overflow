class QuestionsController < ApplicationController

  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(direction: :up)
    # @votes = @question.votes
    upvotes = @question.votes.where(direction: :up).count
    downvotes = @question.votes.where(direction: :down).count
    @votes = upvotes - downvotes
    @questions = Question.all
  end

  def downvote
    @questions = Question.all
    @question = Question.find(params[:id])
    @question.votes.create(direction: :down)
    # @votes = @question.votes
    upvotes = @question.votes.where(direction: :up).count ## numero
    downvotes = @question.votes.where(direction: :down).count ## numero
    @votes = upvotes - downvotes
  end

  def index ## get '/(questions)/' do
    @question = Question.new
    @questions = Question.all
    api = Github::Client.new
    @quote = api.zen(ENV['GITHUB_TOKEN']).quotes
    respond_to do |format|
      format.html
      format.json
    end
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
    @questions = Question.all
    @question = Question.new(question_params)
    @question.save
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
