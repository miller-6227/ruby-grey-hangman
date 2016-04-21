require 'set'
class StaticPagesController < ApplicationController
  def login
  end

  def game
    @user = current_user
  end
  
  def guestlogin
    @user = User.find_by name: "guest"
    if @user !=nil
      log_in @user
    else
      @user = User.new
      @user.name ="guest"
      @user.high = 0
      @user.games = 0
      @user.save
      log_in @user
    end
    redirect_to root_url
  end

  def contact
  end
=begin
  def statistics
      @frequency = []
      @percent = []
      i=0
      sum = 0

      ('A'..'Z').each do |l|
        letter = Letter.find i
        @frequency[i] = letter.frequency
        sum += @frequency[i]
        i++
      end

      i=0
      ('A'..'Z').each do |l|
        @percent[i] = (@frequency[i]/sum)*100
        i++
      end
  end
=end

  def leaderboard
      @current = current_user
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
