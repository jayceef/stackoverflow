class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:id)
    @zen = Github::Client.new(ENV['GITHUB_TOKEN']).zen
    @notworthy = "Sometimes you are not worthy of what you don't yet know or see"
    @question = Question.new
    @questions.each do |question|
      if question.voteup == nil
        question.voteup = 0
      elsif question.votedown == nil
        question.votedown = 0
      end
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.all.order(:id)
    p @question
    p @answer
  end


  def new
    @question = Question.new
    @question.voteup = 0
    @question.votedown = 0
    render :partial => "new"
  end

  def edit
    @question = Question.find(params[:id])
  end


  def create
    p "*" * 50
    p params
    p question_params
    @question = Question.new(question_params)
    @question.voteup = 0
    @question.votedown = 0

    if @question.save
      redirect_to @question
    else
      render :partial => "new"
    end

  end

  def upvote
    @question = Question.find(params[:id])

    @question.increment!(:voteup)
    @id = @question.id
    @votes = @question.voteup - @question.votedown
    render json: { votes: @votes, id: @id }

  end

  def downvote
    @question = Question.find(params[:id])

    @question.increment!(:votedown)
    @id = @question.id
    @votes = @question.voteup - @question.votedown
    render json: { votes: @votes, id: @id }
  end

  def update
    @question = Question.find(params[:id])
    @question.voteup = 0
    @question.votedown = 0

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private

    def question_params
      params.require(:question).permit(:title, :text, :voteup, :votedown)
    end

end
