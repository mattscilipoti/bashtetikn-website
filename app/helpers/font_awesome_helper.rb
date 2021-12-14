module FontAwesomeHelper
  IconTypeAbbreviations = {
    brand: :fab,
    duotone: :fad,
    light: :fal,
    regular: :far,
    solid: :fas,
    uploaded: :fak
  }

  def font_awesome_icon(icon_name, caption: nil, icon_type: :solid, html_options: {})
    image_type_abbreviation = IconTypeAbbreviations.fetch(icon_type)
    image_classes = [image_type_abbreviation, "fa-#{icon_name.to_s.parameterize}"]
    html_option_classes = html_options.fetch(:class, '').split(' ')
    css_class = image_classes + html_option_classes
    caption = "&nbsp;#{caption}".html_safe if caption
    html_options.merge!({class: css_class.join(' ')})
    content_tag(:i, caption, html_options)
  end
end
