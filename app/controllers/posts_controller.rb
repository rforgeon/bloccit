class PostsController < ApplicationController
  def index
    @posts = Post.all
    spamFilter
  end

  def show
  end

  def new
  end

  def edit
  end

  def spamFilter
    @posts = Post.all
    count = 0
    @posts.each do |spam|
      if count % 5 == 0
        spam.title = "SPAM"
        spam.save
      end
      count = count+1
    end
  end

end
