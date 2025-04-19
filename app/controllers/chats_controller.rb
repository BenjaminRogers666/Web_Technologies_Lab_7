class ChatsController < ApplicationController
  def index
    @chats = Chat.all.includes(:sender, :receiver, :messages)
  end
end