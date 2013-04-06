# Using https://github.com/pusher/pusher-gem      
class PusherController < ApplicationController
    protect_from_forgery :except => :auth # stop rails CSRF protection for this action

    def auth
  	    @room_info = Pusher.get('/channels/'+params[:channel_name], {info: 'user_count'})
  	    if room_not_full        
            authenticate(params)
         else
            render :text => "Forbidden", :status => '403'
        end
    end

    private
    def authenticate(params)
	    response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
  		    :user_id => session[:player_id]
	    })
	    render :json => response
    end

    def room_not_full
	    @room_info[:user_count] < 2
    end 

end
