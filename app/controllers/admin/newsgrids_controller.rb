class Admin::NewsgridsController < AdminController
  before_filter :get_newsgrid, :only => [:edit, :update, :destroy]
  def index
    @newsgrids = Newsgrid.all
  end
  def new
    @newsgrid = Newsgrid.new
  end
  def create
    @newsgrid = Newsgrid.new(params[:newsgrid])
    if @newsgrid.save
      redirect_to admin_newsgrids_url
      flash[:notice] = "New Newsgrid saved!"
    else
      render :new
    end
  end
  def edit
    
  end
  def update
    if @newsgrid.update_attributes(params[:newsgrid])
      redirect_to admin_newsgrids_url
      flash[:notice] = "Newsgrid saved!"
    else
      render :edit
    end
  end
  def destroy
    @newsgrid.destroy
    respond_to :js
  end
  private
  def get_newsgrid
    @newsgrid = Newsgrid.find(params[:newsgrid_id])
  end
end