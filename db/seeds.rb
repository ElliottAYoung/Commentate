require 'faker'
require 'bcrypt'

users = []

10.times do
  users << User.create!(user_name: Faker::Internet.user_name, password_hash: BCrypt::Password.create("password"), profile_picture: Faker::Avatar.image)
end

videos = []

users.each do |user|
  videos << Video.create!(video_name: Faker::Company.catch_phrase, video_url: "https://www.youtube.com/embed/5HRgfxDtaPI", description: Faker::Lorem.paragraph, rating: 5, user_id: user.id) 
  videos << Video.create!(video_name: Faker::Company.catch_phrase, video_url: "https://www.youtube.com/embed/5HRgfxDtaPI", description: Faker::Lorem.paragraph, rating: 5, user_id: user.id) 
end

tags = []

videos.each do |video|
  tags << Tag.create!(name: Faker::Hacker.adjective, video_id: video.id)
  tags << Tag.create!(name: Faker::Hacker.adjective, video_id: video.id)
end

users.each do |user|
  Favorite.create!(user_id: user.id, video_id: videos.sample.id)
end



