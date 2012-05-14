module ApplicationHelper
  def current_user_is_admin?
    current_user && current_user.admin
  end

def admin_link
  if current_user_is_admin?
    "| #{link_to("Admin", admin_path)}".html_safe
  end
end

end
