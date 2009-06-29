# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def slider(id, url, timeout)  
    code = "document.observe('dom:loaded', function() {  
              var slider = new Ferdinand.Slider('#{id}', {
              opacity: 0.8,
              loader: '/images/ajax-loader.gif',
              containerClass: 'side_slider',
              timeout: #{timeout}, 
              url: '#{url}'
              });
            });"
    
    javascript_tag(code)

  end

  def spacer
    '<hr class="spacer"/>'
  end
  
  def map(references, height)
    
    key = 'ABQIAAAANnki5pfM3DRXmD3uA5iY9xRVC8rEueqz8MRIlePQd40iPbt42BT8iIWUz-T33DhOgzKRiwQNTEjbDg'
    key = 'ABQIAAAANnki5pfM3DRXmD3uA5iY9xRVC8rEueqz8MRIlePQd40iPbt42BT8iIWUz-T33DhOgzKRiwQNTEjbDg'
    

    gmap_url = "http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=#{key}"

    code_2 = "function initializeMap() {"
    code_2 << "if(GBrowserIsCompatible()) {"
    code_2 << "var point;"
    code_2 << "var marker;"
    code_2 << "var map = new GMap2(document.getElementById('map_canvas'));"
    code_2 << "map.setCenter(new GLatLng(40, 0), 1);"
    references.each do |ref|
     link = link_to( "<h4>" + ref.location.name + ", " + ref.name , reference_path(ref))
     code_2 << "point = new GLatLng(#{ref.location.lat}, #{ref.location.lng});"
     code_2 << "marker = createMarker(point, '#{link}');"
     code_2 << "GEvent.addListener(marker, 'mouseover', function() { this.openInfoWindowHtml('<h4>" + ref.location.name + ", " + ref.name + "</h4>'); });"
     code_2 << "GEvent.addListener(marker, 'mouseout', function() { this.closeInfoWindow(); });"
     code_2 << "GEvent.addListener(marker, 'click', function(event) { window.location = '" + reference_url(ref) + "'});"
     code_2 << "map.addOverlay(marker);"
    end
    code_2 << "map.setUIToDefault(); }}"
    
  #  code_2 = "function initializeMap(references) {"
  #  code_2 << "references.extend();"
  #  code_2 << "if(GBrowserIsCompatible()) {"
  #  code_2 << "var point;"
  #  code_2 << "var map = new GMap2(document.getElementById('map_canvas'));"
  #  code_2 << "map.setCenter(new GLatLng(40, 0), 1);"
  #  code_2 << 'references.each(function(r) {'
  # code_2 << "point = new GLatLng(r.lat, r.lng);"
  # code_2 << "map.addOverlay(createMarker(point, '<h4>Test</h4>'));"
  #  code 2 << "});"
    
  #  code_2 << "map.setUIToDefault(); }}"
    
    div = "<div id=\"map_canvas\" style=\"height: #{height}px\" onunload=\"GUnload()\"></div>"
    
   # code_3 = "references = new Array();"
   # references.each do |ref|
   #   code_3 << "reference = new Object();"
   #   code_3 << "reference.lat = #{ref.location.lat};"
   #   code_3 << "reference.lng = #{ref.location.lng};"
   #   code_3 << "references.push(reference);"
   # end
    
    code_3 = "Event.observe('map_canvas','load', initializeMap());"

    return(javascript_tag('', :src => gmap_url ) + javascript_tag(code_2)  + div + javascript_tag(code_3))
    
  end

end