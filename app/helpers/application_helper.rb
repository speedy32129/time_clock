module ApplicationHelper

  def time_clock_for(user)
    TimeClock.find_by_user_id(user.id)
  end

  def user_from_id(user_id)
    User.find_by_id(user_id)
  end

  def global_allowed_to?(user, action)
    return false if user.nil?

    if user.allowed_to?(action, p)
      return true
    else

      return false
    end
  end
end