class AddSortOrderToBlogCat < ActiveRecord::Migration
  def self.up
    add_column :article_categories, :sort_order, :integer
    fs = FeaturableSection.first
    m = Menu.first
    if m and fs
      m.featurable_sections << fs
      m.save
    end
    fs = FeaturableSection.create(:title => "Four articles", :image_required => true)
    fs.menus << m
    fs.save
    fs = FeaturableSection.create(:title => "Alert article", :image_required => false)
    fs.menus << m
    fs.save
    fs = FeaturableSection.create(:title => "Blog Category", :image_required => true)
    fs.menus << m
    fs.save
  end

  def self.down
    remove_column :article_categories, :sort_order
  end
end
