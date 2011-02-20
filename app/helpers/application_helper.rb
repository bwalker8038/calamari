module ApplicationHelper
  # creates a submit button with the given name with a cancel link
  # accepts two arguments: Form object and the cancel link name
  def submit_or_cancel(form, name='Cancel')
    link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end
