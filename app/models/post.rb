class Post < ActiveRecord::Base
  has_many :comments

  post = Post.all
  count = 0
  post.each do |spam|
    if count % 5 == 0
      spam.title = "SPAM"
      spam.save
    end
    count = count+1
  end

end
