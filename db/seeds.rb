require 'random_data'

5.times do
   User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all


15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all



50.times do
  Post.create!(
  user: users.sample,
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  user: users.sample,
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

  user = User.first
   user.update_attributes!(
     email: 'rforgeon@gmail.com',
     password: 'password'
   )

 # admin user
  admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'password',
    role:     'admin'
  )

  # member user
  member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'password'
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
