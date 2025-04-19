class MessagesController < ApplicationController
  def index
    @messages = Message.all.includes(:user, :chat)
  end
end