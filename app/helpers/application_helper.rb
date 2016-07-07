module ApplicationHelper

  def require_admin
    unless current_user && current_user.has_role?(:admin)
      flash[:alert] ="Nie masz admina"
      redirect_to root_path
    end
  end
  def require_admin_bool
  current_user && current_user.has_role?(:admin)
  end

end
