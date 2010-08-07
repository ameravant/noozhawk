class ArticleCategory < ActiveRecord::Base
  require "#{Rails.root}/vendor/plugins/siteninja/siteninja_blogs/app/models/article_category.rb"
  has_attached_file :alt_logo, {:styles => { :thumb => "48x36>", :small => "85x55>", :medium => "9999>x93", :large => "880x9999>", :slide => "550x9999>" }}.merge(PAPERCLIP_OPS)
  attr_accessor :remove_alt_logo
end