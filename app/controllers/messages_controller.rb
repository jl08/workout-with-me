class MessagesController < ApplicationController
  # You dont generally call your "params" method in a before filter... use it
  # when you try to retrieve your params directly:
  #
  # Message.create(message_attributes)
  before_action :message_attributes, only: [:create]

  def index
    @match = Match.find(params[:match_id])
    @messages = @match.messages.all
    # This is a little cleaner
    @receiver = @match.initiator == current_user ? @match.responder : @match.initiator
    # if @match.initiator == current_user
    #   @receiver = @match.responder
    # else
    #   @receiver = @match.initiator
    # end
    # @rating = Rating.new
  end

  def create
    # This is going to raise an Exception, which may not be what you want.  Use
    # if Message.create(message_attributes)
    # else
    # end
    @message = Message.create!(message_attributes)
  end

  private

  def message_attributes
    params.require(:message).permit(:content,:match_id,:sender_id,:receiver_id)
  end

end
