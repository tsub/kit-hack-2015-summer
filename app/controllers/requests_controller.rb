class RequestsController < ApplicationController
  def index
    token_check
    @receivers = []
    @senders = []
    @sender_statuses = @current_user.senders.order('updated_at DESC')
    @receiver_statuses = @current_user.receivers.order('updated_at DESC')

    @sender_statuses.each do |sender_status|
      receiver = User.find(sender_status.receiver_id)
      @receivers.push({name: receiver.name, avatar: receiver.avatar})
    end

    @receiver_statuses.each do |receiver_status|
      sender = User.find(receiver_status.sender_id)
      @senders.push({name: sender.name, avatar: sender.avatar})
    end
  end
end
