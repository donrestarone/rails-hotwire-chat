class Message < ApplicationRecord
  belongs_to :room

  has_rich_text :content

  after_create_commit :broadcast_to_room

  private

  def broadcast_to_room
    room = self.room
    broadcast_append_to "room-#{room.id}"
  end
end
