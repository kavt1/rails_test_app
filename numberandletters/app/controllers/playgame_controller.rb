require 'open-uri'
require 'json'

class PlaygameController < ApplicationController
  def game
    @grid = generate_grid(10)
    @letters = @grid.split('')
    @start_time = DateTime.now
  end

  def score
    @your_word = params[:query]
    letter_grid = params[:grid].split('')
    start_time = DateTime.parse(params[:start_time])
    end_time = DateTime.now
    @time_taken = (end_time.to_i - start_time.to_i)

    @translation = get_translation(@your_word)
    error_grid = check_input_against_grid(letter_grid, @your_word)
    if error_grid && !@translation.nil?
      @message = 'not in the grid'
    elsif @translation.nil?
      @message = 'not an english word'
      @translation = 'no translation found'
    else
      @message = 'well done'
    end

    @score = score_time(@time_taken) + score_length(@your_word) unless error_grid || @translation.nil?

  end

  def get_translation(attempt)
    url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
    result = nil
    translation_result = JSON.parse(open(url).read)
    if !translation_result["Error"]
      result = translation_result["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
    end
    result
  end

  def generate_grid(grid_size)
    word = ''
    (0...grid_size).each do
      word += ('A'..'Z').to_a[rand(26)]
    end
    word
  end

  def score_time(time)
    score = 0
    if time < 5
      score = 10
    elsif time < 10
      score = 8
    elsif time < 40
      score = 5
    else
      score = 1
    end
    score
  end

  def score_length(attempt)
    attempt.length * 10
  end

  def check_input_against_grid(grid, attempt)
    error = false
    (0...attempt.length).each do |i|
      char = attempt[i]
      index = grid.index(char)
      if index
        grid.delete_at(index)
      else
        error = true
        break
      end
    end
    error
  end
end
