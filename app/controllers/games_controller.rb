class GamesController < ApplicationController
  require 'json'
  require 'net/http'
  require 'spreadsheet'

  def index
    render :text => "index method"
  end

  def show
    if room_not_full(params)
      @game = Game.find(params[:id])
    else
      flash[:error] = "You are not a player in that game."
      redirect_to root_path
    end
  end

  def populate
    url = getdataseturl()
    file = savedataset(url)
    readdataset(file)
  end

  def switch
    if user_is_in_game(params)
      Pusher.trigger('presence-' + params[:id] +'-'+session[:player_id].to_s, 'switch', {some: 'data'})
      render :text => "success", :status => '200'
    else
      render :text => "Forbidden", :status => '403'
    end
  end

    def build_and_send_turns()
        Rails.logger.info(params[:id])
        player = Player(params[:id])
        game = player.game
        
        turnP1 = Turn.new(game, 0, 1)
        turnP1.send_to_player(game.id, game.players[0].id)
        turnP2 = Turn.new(game, 1, 0)
        turnP2.send_to_player(game.id, game.players[1].id)
    end


private
  def getdataseturl
    meta_url = "http://data.gov.uk/api/2/rest/package/ni-112-under-18-conception-rate"
    meta_uri = URI(meta_url)
    meta_json = Net::HTTP.get(meta_uri)
    meta_hash = JSON.parse(meta_json)
    return meta_hash["resources"][0]["url"]
  end

  def savedataset(url)
    temppath = "temp.xls"
    dataset_uri = URI(url)
    dataset = Net::HTTP.get(dataset_uri)
    
    File.open(temppath, "wb") do |f|
      f.write(dataset)
    end

    return temppath
  end

  def readdataset(file)
    dataset = Spreadsheet.open(file)
    
    # use dataset here 
  end

  def room_not_full(params)
    room_info = Pusher.get('/channels/presence-'+params[:id]+'-'+session[:player_id].to_s, {info: 'user_count'})
    return room_info[:user_count] < 2
  end

  def user_is_in_game(params)
    found = false
    users = Pusher.get('/channels/presence-'+params[:id]+'-'+session[:player_id].to_s+'/users')[:users]
    Rails.logger.info(users)
    Rails.logger.info(session[:player_id])
    users.each { |user_in_room|
      if user_in_room.value?(session[:player_id].to_s)
        found = true
      end
    }
    return found
  end
end

