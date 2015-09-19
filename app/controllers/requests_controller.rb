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
    respond_to do |format|
      @request = Request.new(request_params)

      if @request.save
        format.json { render nothing: true, status: :created }
      else
        logger.debug @request.errors.full_messages
        format.json { render nothing: true, status: :bad_request }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.json { render json: @request }
      else
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def request_params
    params.require(:request).permit(:sender_id, :receiver_id, :message, :status)
  end
end
