# frozen_string_literal: true

class TurboRoomsController < ApplicationController
  def index
    @messages = TurboMessage.order(created_at: :asc).limit(20)
  end

  def new
    @message = TurboMessage.new
  end

  def create
    @message = TurboMessage.new(message_params)

    if @message.save
      @message.broadcast_append_to(:messages, target: :messages,
                                              partial: "turbo_rooms/messages/message", locals: { message: @message })
      flash.now.notice = "Message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:turbo_message).permit(:content)
  end
end
