module ApplicationHelper
  def current_controller?(name)
    controller_name == name
  end

  def current_action?(name)
    action_name == name
  end

  def selected(controller, action)
    current_action?(action) && current_controller?(controller) ? 'active' : ''
  end
end
