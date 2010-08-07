class AddAltLogoToArticleCategories < ActiveRecord::Migration
  def self.up
    add_column :article_categories, :alt_logo_file_name, :string
    add_column :article_categories, :alt_logo_content_type, :string
    add_column :article_categories, :alt_logo_updated_at, :datetime
    add_column :article_categories, :alt_logo_file_size, :integer
    add_column :article_categories, :alt_logo_url, :string
  end

  def self.down
    remove_column :article_categories, :alt_logo_file_name
    remove_column :article_categories, :alt_logo_content_type
    remove_column :article_categories, :alt_logo_updated_at
    remove_column :article_categories, :alt_logo_file_size
    remove_column :article_categories, :alt_logo_url
  end
end
