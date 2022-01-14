module PageScansHelper
  def page_scan_icon(page_scan_class_or_model, html_options = {})
    default_html_options = {
      alt: "Icon for #{page_scan_class_or_model.validator_name}", 
      class: 'icon page_scan_icon',
      title: "#{page_scan_class_or_model.validator_name}",
    }
    image_tag page_scan_class_or_model.icon_name, default_html_options.merge(html_options)
  end

  def perform_page_scan_link_to(page_scan_class:, scanned_model:, caption: nil, &block)
    scan_text = case scanned_model
              when PageScan, Webpage
                "an #{page_scan_class.name.titleize}"
              when Website
                "#{page_scan_class.name.titleize.pluralize} for all pages"
              else
                raise ArgumentError, "Unsupported scanned_model (#{scanned_model.class.name})."
              end

    tooltip = "Perform #{scan_text} (via #{page_scan_class.validator_uri})"

    controller_name = scanned_model.class.name.pluralize.downcase
    url_info = {
      controller: controller_name,
      action: page_scan_class.name.underscore,
      id: scanned_model.id,
    }

    if block_given?
      link_to(url_info, title: tooltip) do
        html_parts = []
        html_parts << page_scan_icon(page_scan_class, title: tooltip)
        html_parts << capture(&block)
        html_parts.join(' ').html_safe
      end
    else
      caption ||= "Perform #{page_scan_class.name.titleize}"

      link_to(url_info, title: tooltip) do
        page_scan_icon(page_scan_class, title: tooltip) + caption
      end
    end
  end
end
