require 'set'
class StaticPagesController < ApplicationController
  def login
  end

  def game
    @user = User.find(params[:id])
    dict = Set.new

    File.foreach('dictionary.txt') {|word| dict.add(word.chomp)}
    guesses = 18
    word = rand(4..7).times.map {false}
    dict.reject! {|w| w.length != word.length}
  end

  def contact
  end

  def help
  end
  
  def welcome
  end
end
