module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages

    content_tag(:div, class: 'alert alert-danger') do
      if messages.length > 1
        content_tag(:ul, messages.map { |msg| content_tag(:li, msg) }.join)
      else
        content_tag(:p, messages.first)
      end
    end
  end

end