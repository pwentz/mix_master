class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates :title, presence: true, length: (0..45)
end
