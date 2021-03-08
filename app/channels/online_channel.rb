class OnlineChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'Subscribed to OnlineChannel'

    stream_from 'online_channel'

    current_user.update(online: true)

    ActionCable.server.broadcast 'online_channel',
                                 user_id: current_user.id,
                                 online: true
  end

  def unsubscribed
    logger.info 'Unsubscribed to OnlineChannel'

    current_user.update(online: false)

    ActionCable.server.broadcast 'online_channel',
                                 user_id: current_user.id,
                                 online: true
  end
end
