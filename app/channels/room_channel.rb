# サーバーサイドの処理をするファイル
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # サブスクライブさせるチャネルを指定
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # サーバーサイドのspeakアクションの定義
  def speak(data)
    Message.create! content: data['message']
    # ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
