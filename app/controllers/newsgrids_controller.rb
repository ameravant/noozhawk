class NewsgridsController < ApplicationController
  before_filter :get_page
  def show
    @newsgrid = Newsgrid.find(params[:id])
    @articles = @newsgrid.stories
  end
  private
  def get_page
    @page = Page.find_by_permalink!('newsgrids')
    @menu = @page.menus.first
  end
end