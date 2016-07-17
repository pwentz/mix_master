class Artist < ActiveRecord::Base
  has_many :songs
  validates :name, presence: true, uniqueness: true, length: (1..30)
  validates :image_path, presence: true
end
