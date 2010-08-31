class ProfilesController < ApplicationController
  unloadable
  require "#{Rails.root}/vendor/plugins/siteninja/siteninja_profiles/app/controllers/profiles_controller.rb"
  def index
    add_breadcrumb "Profiles", nil
    profiles = params[:search].blank? ? Profile.standard : Profile.search_for(params[:search]).reject{|p| p.profile.blank?}.reject{|p| !p.profile.public?}.reject{|p| !p.user.has_role?("Author")}.sort_by{|p| p.last_name.downcase}
    @profiles = profiles.paginate(:page => params[:page], :per_page => 25)  
  end
  
  def create
    @person = Person.new(params[:person])
    params[:person][:user_attributes].merge!({ :name => params[:person][:name], :email => params[:person][:email] })
    params[:person][:person_group_ids] ||= []
    @person.confirmed = !@cms_config['site_settings']['member_confirmation']
    @person.person_group_ids = @person.person_group_ids << PersonGroup.find_by_title("Contributor").id
    if @person.save
      profile = Profile.new(params[:profile])
      profile.person_id = @person.id
      profile.public = true
      profile.save
      redirect_to new_session_path
      flash[:notice] = "Thanks for joining! Please sign-in"
    else
      render :action => "new"
    end
  end
end