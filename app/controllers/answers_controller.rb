class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end


  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end


  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id

    if @answer.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def upvote
    @answer = Answer.find(params[:id])

    @answer.increment!(:voteup)
    redirect_to :back

  end

  def downvote
    @answer = Answer.find(params[:id])

    @answer.increment!(:votedown)
    redirect_to :back
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to @answer
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to :back
  end

  private

    def answer_params
      params.require(:answer).permit(:title, :text)
    end

end
