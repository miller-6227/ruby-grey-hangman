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

  def leaderboard
      @user = User.order("high DESC").first
      @second = User.order("high DESC").second
      @third = User.order("high DESC").third
      @fourth = User.order("high DESC").fourth
      @fifth = User.order("high DESC").fifth
      @sixth = User.order("high DESC").at(6)
      @seventh = User.order("high DESC").at(7)
      @eigth = User.order("high DESC").at(8)
      @ninth = User.order("high DESC").at(9)
      @tenth = User.order("high DESC").at(10)

  end

  def help
  end
  
  def welcome
  end
end
