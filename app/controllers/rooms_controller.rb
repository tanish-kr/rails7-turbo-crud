# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @messages = Message.all
  end
end
