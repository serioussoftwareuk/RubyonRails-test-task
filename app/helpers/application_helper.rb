module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def google_map(place, static = false)
    key = ENV['GOOGLE_MAPS_KEY'] || ''
    coordinates = "#{place.latitude}, #{place.longitude}"
    static ? map_image(key, coordinates) : map_iframe(key, coordinates)
  end

  def map_image(key, coordinates)
    src = "https://maps.googleapis.com/maps/api/staticmap?key=#{key}&center=#{coordinates}&size=300x100&zoom=17&markers=color:blue%7C#{coordinates}"
    image_tag(src)
  end

  def map_iframe(key, coordinates)
    src = "https://www.google.com/maps/embed/v1/place?key=#{key}&q=#{coordinates}"
    content_tag(:iframe, '', src: src, width: '100%', height: 500, frameborder: 0)
  end
end
