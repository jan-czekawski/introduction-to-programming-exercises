class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(page: params[:page])
    @locations = post_markers @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    near_posts = @post.near(params[:max_miles], params[:min_miles], params[:limit])
    @locations = post_markers near_posts
    pp @locations
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:id, :city, :state, :pop)
    end
    
    def post_markers posts
      # build the marker for the center of the map
      if @post
        center_marker = Gmaps4rails.build_markers(@post) do |post, marker|
          marker.lat post.latitude
          marker.lng post.longitude
          marker.infowindow post.city
          marker.picture(:url => "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
                         :width => 32,
                         :height => 32)
        end
      end
      
      # build markers for map
      marked_post = @post.nil?
      locations = Gmaps4rails.build_markers(posts) do |post, marker|
        marker.lat post.latitude
        marker.lng post.longitude
        marker.infowindow post.city
        # add special marker for target city
        if @post && post.id == @post.id
          marker.picture center_marker[0][:picture]
          marked_post = true
        end
      end
      
      # add target city of left out
      locations << center_marker[0] if !marked_post
      return locations
    end

end
