class CreatePlaylistSongsTable < ActiveRecord::Migration
  def change
    create_table :playlist_songs_tables do |t|
      t.references :playlist, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
    end
  end
end
