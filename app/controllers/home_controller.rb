class HomeController < ApplicationController

  def index
    
  end

  def questions
    @questions = Question.all
  end

  def question
    @question = Question.where(id: params[:question_id]).first
  end

  def topics
    @topics = Topic.all
  end

end
