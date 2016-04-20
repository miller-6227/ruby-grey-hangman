require 'set'
class StaticPagesController < ApplicationController
  def login
  end

  def game
    @user = current_user
    
  end

  def contact
  end

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
