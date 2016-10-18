require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

def foundPost
  post = Post.find_or_create_by!(title: "Manual Seed Post") do |post|
    post.body = "This is a manually seeded body. Beep, boop, bop."
  end
  return post
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by!(post: foundPost) do |comment|
  comment.body = "This is a manually comment body. Bop, boop, beep."
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
