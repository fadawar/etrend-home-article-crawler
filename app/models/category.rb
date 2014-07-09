class Category < ActiveRecord::Base
  has_many :articles

  def self.parse_categories(html)
    doc = Nokogiri::HTML.parse(html)

    mainmenu = doc.search('.mainmenu li.active a').text
    sub_item = doc.search('.submenu li.active a').first
    submenu = sub_item.text
    cat_name = mainmenu + ': ' + submenu
    submenu_url = sub_item[:href]

    Category.find_or_create_by!(name: cat_name, url: submenu_url)
  end

end
