# frozen_string_literal: true

class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("room_channel", { message: render_message(message) })
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: "rooms/messages/message",
                                          locals: { message: message })
  end
end
