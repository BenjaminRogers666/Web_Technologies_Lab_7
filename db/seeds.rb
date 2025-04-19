
10.times do |i|
    User.create!(
      email: "user#{i}@example.com",
      first_name: "Nombre#{i}",
      last_name: "Apellido#{i}"
    )
  end
  
  # Crear 10 chats (asociando usuarios existentes)
  users = User.all
  10.times do |i|
    Chat.create!(
      sender_id: users.sample.id,
      receiver_id: users.sample.id
    )
  end
  
  # Crear 10 mensajes (asociando chats y usuarios)
  chats = Chat.all
  10.times do |i|
    Message.create!(
      chat_id: chats.sample.id,
      user_id: users.sample.id,
      body: "Este es el mensaje ##{i + 1}"
    )
  end