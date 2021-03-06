module ApplicationHelper
  # rubocop: disable Style/HashSyntax
  def flash_message
    if flash[:notice]
      content_tag :p, notice, :class => 'bg-success m-0 text-white text-center p-2'
    elsif flash[:alert]
      content_tag :p, alert, :class => 'bg-danger m-0 text-white text-center p-2'
    end
  end
  # rubocop: enable Style/HashSyntax

  # rubocop: disable Style/RedundantInterpolation, Style/LineEndConcatenation
  def signed_in?
    if user_signed_in?
      ("#{link_to current_user.name, edit_user_registration_path, class: 'btn text-light m-2'}" <<
       "#{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'btn text-light m-2'}").html_safe
    else
      ("#{link_to 'Sing In', new_user_session_path, class: 'btn text-light m-2'}" <<
       "#{link_to 'Sing Up', new_user_registration_path, class: 'btn text-light m-2'}").html_safe
    end
  end
  # rubocop: enable Style/RedundantInterpolation, Style/LineEndConcatenation

  def profile_col
    if user_signed_in?
      (render 'profile').html_safe
    else
      (render 'trends').html_safe
    end
  end
end
