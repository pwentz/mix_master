class RenamePlaylistSongsTable < ActiveRecord::Migration
  def change
    rename_table :playlist_songs_tables, :playlist_songs
  end
end
