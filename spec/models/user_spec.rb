require 'rails_helper'

describe User, :type => :model do
  context "associations" do
    it { should have_many(:playlists)}
  end

  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:uid)}
    it { should validate_uniqueness_of(:uid)}
    it { should validate_presence_of(:provider)}
  end
end

