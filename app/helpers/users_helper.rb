module UsersHelper
  def submit_or_cancel(form, name='Cancel')
    link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end
end
