class GameController < ApplicationController
  def index
  	render :text => "index method"
  end

  def show
  	render :text => "show method"
  end

  def populate
  	render :text => "populate method"
  end
end
