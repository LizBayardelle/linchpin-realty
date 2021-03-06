class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:show, :index]

  # GET /blogs
  def index
    @pillars = Pillar.all
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag]).order("created_at DESC")
    else
      @blogs = Blog.all.order("created_at DESC")
    end
    if current_user
      @user = current_user
    end
  end

  # GET /blogs/1
  def show
    @pillars = Pillar.all
    @pillar = Pillar.find_by(id: @blog.pillars_id)
    @related = Blog.where(pillars_id: @blog.pillars_id).where.not(id: @blog.id).limit(4)
    @comment = @blog.comments.build
    @comments = Comment.where(blog_id: @blog.id, approved: true)
    if current_user
      @user = current_user
    end
  end

  def download_pdf
    @blog = Blog.friendly.find(params[:id])
    send_file File.new(Rails.root.join(@blog.link_filename)), type: "application/pdf"
  end

  # GET /blogs/new
  def new
    @pillars = Pillar.all
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @pillars = Pillar.all
  end

  # POST /blogs
  def create
    # @pillars = Pillar.all
    @blog = Blog.new(blog_params)
    @blog.image.attach(params[:blog][:image])
    @blog.user = current_user

    if @blog.save
      # @blog.pins.attach(pin_images)
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    @pillars = Pillar.all
    pin_images = params[:blog][:pins]

    if pin_images
      @blog.pins.purge
    end
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @pillars = Pillar.all
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(
        :title,
        :teaser,
        :body,
        :user_id,
        :tag_list,
        :link_text,
        :link_filename,
        :optin,
        :optin_tags,
        :published,
        :published_at,
        :pillars_id,
        :image,
        :resource_id,
        pins: []
      )
    end

end
