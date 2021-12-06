module FoundationHelper
  def foundation_menu_list_item(caption, url_options, html_options={})
    default_html_options = current_page?(url_options) ? { class: 'is-active' } : {}
    content_tag(:li, default_html_options) do
      link_to caption, url_options, html_options
    end
  end
end
