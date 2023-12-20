module ApplicationHelper
  # standard element to display datetime
  def datetime_el(datetime, include_seconds: true, element_container_type: :span)
    return nil if datetime.blank?

    content_tag(element_container_type, title: datetime) do
      "#{time_ago_in_words(datetime, include_seconds: include_seconds)} ago"
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
      font_awesome_icon(icon, caption: caption) + message
    end
  end

  def menu_list_item(caption, url_options, html_options={})
    default_css_classes = []
    default_css_classes << 'is-active' if current_page?(url_options)
    default_html_options = { class: default_css_classes}
    content_tag(:li, default_html_options) do
      link_to caption, url_options, html_options
    end
  end
end
