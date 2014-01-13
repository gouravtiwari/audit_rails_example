module ApplicationHelper
  def current_controller?(name)
    controller_name == name
  end

  def current_action?(actions)
    actions.include?(action_name)
  end

  def selected(controller, actions=[])
    current_action?(actions) && current_controller?(controller) ? 'active' : ''
  end
end
