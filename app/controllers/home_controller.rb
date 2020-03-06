class HomeController < ApplicationController

  def index
    @questions = Question.includes(:answers).all
  end

  def question
    @question = Question.includes(:answers).where(params[:question_id]).first
  end


end
