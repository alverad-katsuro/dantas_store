module UsersHelper
  def current_auth_resource
    if user_signed_in?
      current_user
    end
  end

  def current_ability
      @current_ability or @current_ability = Ability.new(current_auth_resource)
  end
end
