module PageScansHelper
  def page_scan_link_to(page_scan_class:, model:, caption: nil, &block)
    tooltip = case model
              when Website
                "#{page_scan_class.name.titleize} all pages"
              when PageScan
                page_scan_class.name.titleize
              else
                raise ArgumentError, "Unsupported model (#{mode.class.name})."
              end

    tooltip += " (via #{page_scan_class.validator_uri})"

    controller_name = model.class.name.pluralize.downcase
    url_info = {
      controller: controller_name,
      action: page_scan_class.name.underscore,
      id: model.id,
    }

    if caption.present?
      link_to(caption, url_info, title: tooltip)
    else
      link_to(url_info, title: tooltip, &block)
    end
  end
end
