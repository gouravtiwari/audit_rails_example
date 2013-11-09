module ApplicationHelper
  def current_controller?(name)
    controller_name == name
  end

  def selected(name)
    current_controller?(name) ? 'active' : ''
  end
end
