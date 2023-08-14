require "open-uri"


class GamesController < ApplicationController
  def new
  alphabet = ('a'..'z').to_a
  @letters = alphabet.sample(5).join(' ')

  end
  def score
    @scoreNew = 0
    @word = params["word"]
    @letters = params["test"]

    @display = "Thats not a valid word!"
    #  includes = @letters.all? { |e| @word.include?(e) }
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = URI.open(url).read
    result = JSON.parse(response)



    if result["found"] && @word.chars.all? { |e| @letters.include?(e) }
      @scoreNew += 100
    else
      @display
    end

    # if @word.include("@letters")

  end
end
