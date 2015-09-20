class RequestsController < ApplicationController
  skip_before_filter :require_valid_token, only: [:create, :update, :destroy]

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

  def create
    token_check
    respond_to do |format|
      @request = Request.new({
          sender_id: @current_user.id,
          receiver_id: params[:receiver_id],
          message: params[:message],
          status: 0
        })

      if @request.save
        format.json { render json: { status: :created } }
      else
        logger.debug @request.errors.full_messages
        format.json { render json: { status: :bad_request } }
      end
    end
  end

  def update
    token_check
    @request = @current_user.receivers.find_by(sender_id: params[:sender_id])
    respond_to do |format|
      if @request.update({ status: params[:status] })
        format.json { render json: @request }
      else
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    token_check
    @current_user.senders.find_by(receiver_id: params[:receiver_id]).destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
