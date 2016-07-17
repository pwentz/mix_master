class Playlist < ActiveRecord::Base
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  validates :name, presence: true, length: (0..45)

  def update_attributes(updated_playlist, song_ids)
    update_attribute(:name, updated_playlist.name)
    songs.destroy_all
    update_songs(song_ids)
  end

  def update_songs(song_ids)
    songs << Song.find(song_ids) unless song_ids.nil?
  end
end
