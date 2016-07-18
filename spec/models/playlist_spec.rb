require 'rails_helper'

describe Playlist, :type => :model do
  context "associations" do
    it { should have_many(:playlist_songs)}
    it { should have_many(:songs).through(:playlist_songs)}
    it { should belong_to(:user) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name) }
  end
end

