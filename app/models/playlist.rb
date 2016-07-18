class Playlist < ActiveRecord::Base
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  belongs_to :user
  validates :name, presence: true, length: (0..45)

  def update_attributes(updated_playlist)
    update_attribute(:name, updated_playlist.name)
    songs.destroy_all
  end

  def update_songs(user, song_ids)
    songs << Song.find(song_ids) unless song_ids.nil?
    user.playlists << self
  end

end
