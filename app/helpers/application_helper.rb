module ApplicationHelper
  # standard element to display datetime
  def datetime_el(element_container_type, datetime)
    content_tag(element_container_type, title: datetime) do
      datetime ? "#{time_ago_in_words(datetime)} ago" : nil
    end
  end

  # External links open in new tab and have 'new-window' icon
  # Unlike link_to, this requires link_text and url
  # NOTE: requires bootstrap for icon link portion
  def external_link_to(link_text, url, html_options = {})
    default_html_options = {class: 'external', target: '_blank', rel:'noopener'}
    link_to(link_text, url, default_html_options.merge(html_options))
  end

  def flash_icon_name(flash_type)
    case flash_type.to_sym
    when :alert
      'triangle-exclamation'
    when :notice
      'circle-info'
    when :success
      'square-check'
    else
      raise ArgumentError, "Unsupported flash_type (#{flash_type})"
    end
  end

  def flash_tag(flash_type, message, caption: nil)
    content_tag(:div, :class => "flash highlight #{flash_type}") do
      icon = flash_icon_name(flash_type)
      font_awesome_icon(icon, caption: caption, html_options: { aria: { hidden: true }}) + message
    end
  end
end
