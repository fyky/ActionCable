class Message < ApplicationRecord
  #空白のまま投稿できないようにする＋エンター長押しの連続投稿を防ぐ
  validates :content, presence: true
  after_create_commit {MessageBroadcastJob.perform_later self}
end
