# This helper module is for helpers that parse content of page body text and do things like
# automatically replace specific formatted text with more advanced HTML, like
# a YouTube video automatically embedding into a page instead of a simple link.

module NinjaParseHelper
unloadable
  # Performs different replacements for things like automatic embedding of videos, images, etc.
  def ninja_parse(content)
    # Youtube video
    content.gsub!(/\bhttp:\/\/(www\.)?youtube\.com\/watch\?v\=([a-zA-Z0-9_\-]+)\b/, render(:partial => "/shared/embed_youtube", :locals => { :video_id => '\2' }))

    # Vimeo video
    content.gsub!(/\bhttp:\/\/(www\.)?vimeo\.com\/(\d+)\b/, render(:partial => "/shared/embed_vimeo", :locals => { :video_id => '\2' }))


    #content.gsub!(/\b(http[s]?:\/\/[^\/]+\/\S*\.)(jpg|jpeg|gif|png)\b/, render(:partial => "/shared/embed_image", :locals => { :image_src => '\1\2'}))

    # Gallery Image Replacement
    # Left Align Image Replacement
    content.gsub!(/\#left_(\S*)_image:(\S*)\#/) {|x| render(:partial => "/shared/embed_image", :locals => {:image_id => $2, :size => $1, :css_class => 'float-left'})}
  
    content.gsub!(/\#(\S*)_image:(\S*)\#/) {|x| render(:partial => "/shared/embed_image", :locals => {:image_id => $2, :size => $1, :css_class => 'float-right'})}
    
  
    # Random Quote Replacement
    content.gsub!(/\#quote:random\#/) {|x| render(:partial => "/shared/embed_testimonial", :locals => {:testimonial_id => "random"})}
    
    # Quote Replacement
    content.gsub!(/\#quote:(\S*)\#/) {|x| render(:partial => "/shared/embed_testimonial", :locals => {:testimonial_id => $1})}
    
    # Slideshow Replacement
    content.gsub!("#slideshow#", render(:partial => "/shared/embed_slideshow"))

    # Image Box Replacement
    content.gsub!("#imagebox#", render(:partial => "/shared/image_box"))
    
    # Advertisement Replacement
    content.gsub!("#inset#") {|x| render(:partial => "/shared/embed_ad")}
    
    content.gsub!(/\#inset:(\S*)\#/) {|x| render(:partial => "/shared/embed_ad_by_zone", :locals => {:zone_id => $1})}
    
    # Stealthily remove those pesky <p> tags surrounding our ninja embeds
    content.gsub!(/<p><div(.{0,}?)<\/p>/m, '<div\1')
    
    # Return the new content
    content
  end

end

