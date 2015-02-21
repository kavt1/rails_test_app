class CoachingControllerController < ApplicationController
  def answer
    if params[:query].nil?
      @myquestion = 'my question'
    else
      @myquestion = params[:query]
    end
    @coach_answer = get_coach_answer(@myquestion)
  end

  def ask
  end

  def get_coach_answer(your_message)
    question_mark_pos = your_message.index('?')
    message = your_message.downcase
    if !question_mark_pos.nil? && question_mark_pos > 0 && question_mark_pos == message.length - 1
      "Silly question, get dressed and go to work!"
    elsif message == "I am going to work right now!".downcase
      ""
    else
      "I don't care, get dressed and go to work!"
    end
  end
end
