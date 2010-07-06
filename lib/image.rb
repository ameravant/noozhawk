class Image < ActiveRecord::Base
  require "#{Rails.root}/vendor/plugins/siteninja/siteninja_core/app/models/image"
  has_attached_file :image, {:styles => { :icon => "32x16>", :thumb => "48x36#", :square => "75x75#", :small => "85x55#", :medium_thumb => "126x105#", :large_thumb => "176x145#", :medium => "200x9999>", :large => "880x9999>", :slide => "550x9999>", :wide_slide => "870x9999>" }}.merge(PAPERCLIP_OPS)
end
