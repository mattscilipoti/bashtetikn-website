module FontAwesomeHelper
  IconTypeAbbreviations = {
    brand: :fab,
    duotone: :fad,
    light: :fal,
    regular: :far,
    solid: :fas,
    uploaded: :fak
  }

  def font_awesome_icon(image_name, caption: nil, icon_type: :solid)
    image_type_abbreviation = IconTypeAbbreviations.fetch(icon_type)
    image_classes = [image_type_abbreviation, "fa-#{image_name.to_s.parameterize}"]
    caption = "&nbsp;#{caption}".html_safe if caption
    content_tag(:i, caption, class: image_classes.join(' '))
  end
end
