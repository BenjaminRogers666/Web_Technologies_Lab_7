class User < ApplicationRecord
    has_many :chats_as_sender, class_name: 'Chat', foreign_key: 'sender_id'
    has_many :chats_as_receiver, class_name: 'Chat', foreign_key: 'receiver_id'
    has_many :messages
  end