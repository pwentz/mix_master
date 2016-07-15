require 'rails_helper'

describe Artist, type: :model do
  context "validations" do
     it { is_expected.to validate_presence_of(:name) }
     it { is_expected.to validate_presence_of(:image_path) }
     it { is_expected.to validate_uniqueness_of(:name) }
  end
end
