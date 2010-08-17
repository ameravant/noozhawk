class AddFieldsForNoozhawkToArticleCategories < ActiveRecord::Migration
  def self.up
    add_column :article_categories, :ad_code_1, :text
    add_column :article_categories, :ad_code_2, :text
    add_column :article_categories, :top_banner_ad_file_name, :string
    add_column :article_categories, :top_banner_ad_content_type, :string
    add_column :article_categories, :top_banner_ad_updated_at, :datetime
    add_column :article_categories, :top_banner_ad_logo_url, :string
    add_column :article_categories, :top_banner_ad_file_size, :integer
    add_column :article_categories, :top_banner_url, :string
  end

  def self.down
    remove_column :article_categories, :top_banner_ad_file_size
    remove_column :article_categories, :top_banner_ad_logo_url
    remove_column :article_categories, :top_banner_ad_updated_at
    remove_column :article_categories, :top_banner_ad_content_type
    remove_column :article_categories, :top_banner_ad_file_name
    remove_column :article_categories, :ad_code_2
    remove_column :article_categories, :ad_code_1
    remove_column :article_categories, :top_banner_url
  end
end
