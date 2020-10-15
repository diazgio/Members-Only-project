class ApplicationController < ActionController::Base
  helper_method :signed_in?

  def signed_in?
    !current_user.nil?
  end
end
