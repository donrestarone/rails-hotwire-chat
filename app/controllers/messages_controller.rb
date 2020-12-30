class MessagesController < ApplicationController
  def create
    Message.create(message_params.merge({room_id: params[:room_id]}))
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
