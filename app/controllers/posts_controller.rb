class PostsController < ApplicationController
  def index
     @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def create
    @post = current_user.posts.create!(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @post = User.first.posts.build
  end

  def edit
    @post = Post.find_by_permalink(params[:permalink])
  end

  def show
    @post = Post.find_by_permalink(params[:permalink])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to show_post_path(@post.permalink), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_path }
      format.json { head :no_content }
    end
  end

end
