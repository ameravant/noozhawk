class Admin::CommentsController < AdminController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  before_filter :authorization, :only => [:update, :destroy]
  before_filter :find_owner
  before_filter :find_comment, :only => [ :edit, :update, :destroy ]

  def index
    add_breadcrumb "Comments"
    if params[:q].blank?
      if @owner
        @all_comments = @owner.comments
      else
        @all_comments = Comment.all
      end
    else
      q = params[:q].strip
      if @owner
        @all_comments = @owner.comments.find(:all, :conditions => ["name like ? or email like ?", "%#{q}%", "%#{q}%"])
      else 
        @all_comments = Comment.find(:all, :conditions => ["name like ? or email like ?", "%#{q}%", "%#{q}%"])
      end
    end
    @comments = @all_comments.paginate(:page => params[:page], :per_page => 50)
  end

  def new
    add_breadcrumb "Comments", "admin_#{@owner.class.name.underscore}_comments_path(@owner)"
    @comment = @owner.comments.build
    @comment.email = current_user.email
    add_breadcrumb "New"
  end

  def create
     @comment = @owner.comments.build(params[:comment])
     @comment.person = current_user.person
    if @comment.save
      flash[:notice] = "Your comment has been added."
      redirect_to [:admin, @owner, :comments]
    else
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Edit"
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment posted by \"#{@comment.name}\" updated."
      redirect_to [:admin, @owner, :comments]
    else
      render :action => "edit"
    end
  end

  def destroy
     @comment.destroy
    respond_to :js
  end


  private

  def find_owner
    params.keys.each do |l|
      if !l.to_s.scan(/\w*_id/).blank?
        @klass = l.to_s.scan(/\w*_id/).to_s.gsub("_id","")
        @owner = @klass.classify.constantize.find(params["#{@klass}_id".to_sym])
      end
    end
  end

  def find_comment
    begin
      @comment = @owner.comments.find(params[:id])
    rescue
      redirect_to [:admin, @owner, :comments]
    end
  end

  def authorization
    authorize(@permissions['comments'], "Comments")
  end
end

