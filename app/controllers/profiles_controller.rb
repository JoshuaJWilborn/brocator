class ProfilesController < ApplicationController

  def new
    if current_user.profile
      redirect_to edit_profile_path(current_user.profile)
    else
      @profile = Profile.new
    end
  end

  def create
    params[:user][:avatar] = params[:profile][:avatar]
    params[:profile].delete(:avatar)
    current_user.profile = Profile.new(params[:profile], :user_id => current_user.id)
    current_user.update_attributes(params[:user])
    current_user.save
    redirect_to root_path
  end

  def edit
    @profile = current_user.profile
  end

  def update
    params[:user][:avatar] = params[:profile][:avatar]
    params[:profile].delete(:avatar)
    current_user.profile.update_attributes(params[:profile], :user_id => current_user.id)
    current_user.update_attributes(params[:user])
    redirect_to profile_path(params[:profile])
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def search
    first_name, last_name = params[:name].split(' ')
    @profile = Profile.where({:fname => first_name, :lname => last_name}).first
    render :show
  end
end
