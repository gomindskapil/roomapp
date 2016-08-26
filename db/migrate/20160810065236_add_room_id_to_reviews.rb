class AddRoomIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :room_id, :integer
  end
end
