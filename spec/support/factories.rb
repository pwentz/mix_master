FactoryGirl.define do
  factory :artist do
    name
    image_path "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg"
  end

  sequence :name, ["A", "B", "C"].cycle do |n|
    "#{n}"
  end

  factory :song do
    title
    artist
  end

  sequence :title do |n|
    "Title #{n}"
  end

  factory :playlist do
    name 
    user
  end

  factory :user do
    provider 'spotify'
    uid 
    name 'Fake User'
  end

  sequence :uid do |n|
   "123#{n}"
  end
end
