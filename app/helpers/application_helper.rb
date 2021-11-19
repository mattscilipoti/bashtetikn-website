module ApplicationHelper
  # External links open in new tab and have 'new-window' icon
  # Unlike link_to, this requires link_text and url
  # NOTE: requires bootstrap for icon link portion
  def external_link_to(link_text, url, html_options = {})
    default_html_options = {class: 'external', target: '_blank', rel:'noopener'}
    link_to(link_text, url, default_html_options.merge(html_options))
  end
end
