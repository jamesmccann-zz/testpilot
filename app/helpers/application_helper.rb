module ApplicationHelper

  # Public: Map flash keys to a known CSS class.
  #
  # Within Rails, any value can be assigned to the flash with any key.
  # While this makes for a flexible system, this means that any key becomes
  # a presentational value. This method maps flash keys to known classes, falling
  # back to a default 'alert-info' class, if none is known.
  #
  # key - The flash key to map
  #
  # Examples
  #
  #   map_flash_key_to_alert_class(:success)
  #   # => :success
  #
  #   map_flash_key_to_alert_class(:alert)
  #   # => :warning
  #
  #   map_flash_key_to_alert_class(:other)
  #   # => :info
  #
  # Returns the alert class
  def map_flash_key_to_alert_class(flash_key)
    return case flash_key.to_sym
    when :notice, :success
      :success
    when :alert, :warning
      :warning
    when :danger, :error
      :danger
    else
      :info
    end
  end

  # Public: Construct a help block element for display
  # in Bootstrap forms.
  #
  # content - The content of the help block
  #
  # Returns HTML-safe string
  def form_help(content)
    content_tag(:p, content, class: 'help-block')
  end
end

