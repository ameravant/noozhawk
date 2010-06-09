class NewsgridsController < ApplicationController
  unloadable
#  layout 'newsgrid'
  def show
    @newsgrid = Newsgrid.find(params[:id])
    @newsgrid.menus_count > 0 ? @menu = @newsgrid.menus.first : @menu = Menu.first
    @articles = @newsgrid.stories
    @menus_tmp = []
        build_tree(@menu)
        add_breadcrumb "Home", "/"
        for menu in @menus_tmp.reverse
          unless menu == @menu
            if menu.navigatable_type == "Page"
              add_breadcrumb menu.navigatable.title, "/#{menu.navigatable.permalink}"
            else
              add_breadcrumb menu.navigatable.title, menu.navigatable
            end
          else  
            add_breadcrumb @menu.navigatable.title
          end
        end
        session[:redirect] = request.request_uri if @members
        authorize("Member", "Members") if @members
    end

  private

  def build_tree(current_menu)
    @menus_tmp << current_menu
    @members = true if current_menu.navigatable.permalink == "members"
    if current_menu.parent_id
      parent_menu = Menu.find(current_menu.parent_id)
      build_tree(parent_menu)
    end  
  end
end