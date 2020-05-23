module ApplicationHelper
  def application_title
    "Senderstrategy - BO"
  end

  def is_login
    controller_name == "sessions" && action_name == "new"
  end
end
