require 'open-uri'
require 'json'

class PlayerController < ApplicationController
  def index
  end

  def audioplayer
    url = "https://dl.dropboxusercontent.com/u/26873847/karaoke/an-owl-sat-alone.json"
    song = JSON.parse(open(url).read)
    @title =  song['title']
    @subtitle = song['subtitle']
    @image_file_name = song['image_file_name']
    @audio_url = song['audio_url']
    @lyrics = song['lyrics']
    @transitions = get_words_transitions(song['lyrics'])
  end

  def videoplayer
    url = "https://dl.dropboxusercontent.com/u/26873847/karaoke/yes_i_can_animal_song.json"
    song = JSON.parse(open(url).read)
    @title =  song['title']
    @subtitle = song['subtitle']
    @media_url = song['media_url']
    @media_type = song['media_type']
    @lyrics = song['lyrics']
    @transitions = get_lines_transitions(song['lyrics'])
  end

  private

  def get_words_transitions(lyrics)
    result = {}
    lyrics.each do |line|
      words = line['words']
      if words
        words.each do |word|
          id = word['id']
          result[id.to_sym] = { time_start:  word['time_start'], time_end: word['time_end'] }
        end
      end
    end
    result
  end

  def get_lines_transitions(lyrics)
    result = {}
    lyrics.each do |line|
      id = line['id']
      result[id.to_sym] = { time_start:  line['time_start'], time_end: line['time_end'] }
    end
    result;
  end
end
