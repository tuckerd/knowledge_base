class QuestionsController < ApplicationController

  def index
  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Question has been created."
      redirect_to @question
    else
      #not yet
    end
  end

  def show
    @question = Question.find(params[:id])
  end

end
