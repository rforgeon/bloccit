class PostsController < ApplicationController

  helper_method :get_link_info
  helper_method :strip_link_id


  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]


  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user


    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     @post.assign_attributes(post_params)

     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
     @post = Post.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

   def get_link_info(link)
     link_obj = LinkThumbnailer.generate(link)
     return link_obj
   end

   def strip_link_id(link)
     link.reverse!
     if link.include? '='
       codeArray = link.split('=',2)
     else
       codeArray = link.split('/',2)
     end
     code = codeArray[0]
     code.reverse!
     return code
   end

   private

   def post_params
     params.require(:post).permit(:title,:body,:link)
   end

   def authorize_user
     post = Post.find(params[:id])
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to [post.topic, post]
     end
   end

end
