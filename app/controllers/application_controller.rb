
class ApplicationController < ActionController::Base
  protect_from_forgery

  include ProfilesHelper

  def after_sign_in_path_for(resource)
    if current_user.profile
      root_path
    else
      new_profile_path
    end
  end
end
