class AddUserRefToPlaylist < ActiveRecord::Migration
  def change
    add_reference :playlists, :user, index: true, foreign_key: true
  end
end
