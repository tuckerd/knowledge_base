class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end


  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(params[:question])
    if @question.valid?
      flash[:notice] = "Question has been created."
      redirect_to @question
    else
      flash[:alert] = "Question has not been created."
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update_attributes(params[:question])
      @question.users |= [current_user]
      flash[:notice] = "Question has been updated."
      redirect_to @question
    else
      flash[:alert] = "Question has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = "Question has been deleted."
    redirect_to questions_path
  end

private
  def find_question
    @question = Question.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The question you were looking for " +
      "could not be found."
    redirect_to questions_path
  end


end
