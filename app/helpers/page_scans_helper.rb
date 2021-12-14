module PageScansHelper
  def page_scan_link_to(page_scan_class:, scanned_model:, caption: nil, &block)
    tooltip = case scanned_model
              when PageScan, Webpage
                page_scan_class.name.titleize
              when Website
                "#{page_scan_class.name.titleize} all pages"
              else
                raise ArgumentError, "Unsupported scanned_model (#{scanned_model.class.name})."
              end

    tooltip += " (via #{page_scan_class.validator_uri})"

    controller_name = scanned_model.class.name.pluralize.downcase
    url_info = {
      controller: controller_name,
      action: page_scan_class.name.underscore,
      id: scanned_model.id,
    }

    if caption.present?
      link_to(caption, url_info, title: tooltip)
    else
      link_to(url_info, title: tooltip, &block)
    end
  end
end
