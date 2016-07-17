require 'rails_helper'

describe Song, :type => :model do
  context "associations" do
    it { should have_many(:playlists).through(:playlist_songs) }
    it { should belong_to(:artist) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title) }
  end
end
