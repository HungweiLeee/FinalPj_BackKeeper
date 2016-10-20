class MessagesChannel < ApplicationCable::Channel
 
	def subscribed
		stream_from "public_room"
  end
 
  def unsubscribed
     # Any cleanup needed when channel is unsubscribed
  end

end