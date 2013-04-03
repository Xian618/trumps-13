class LobbiesController < ApplicationController

    def index

    end

    def queue
        session[:player] = SecureRandom.uuid

        ironmq = IronMQ::Client.new(:token => 'ZwTWFN2PsYBooqLWwrVxx39EYoI', :project_id => '515b70212267d83c8f00708c')
        
        queue = ironmq.queue("open_games")
        size = queue.size
        if (size > 0)
            message = queue.get
            game_to_join = message.body
            message.delete
            Rails.logger.info(game_to_join)
            #join_game(game_to_join)
            #render :text => game_to_join
            @game = Game.find(game_to_join)
            @game.player2 = session[:player]
            redirect_to @game
        else
            @game = make_new_game(session[:player])
            queue.post(@game.id.to_s)
            redirect_to @game
        end
    end
    
    private
    def make_new_game(player_id)
        game = Game.create({:game_id => SecureRandom.uuid, :player1 => player_id}, :without_protection => true)
        return game
    end
    
end
