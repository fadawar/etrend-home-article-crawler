class Article < ActiveRecord::Base
  belongs_to :category

  def self.parse_articles(response)
    html = Nokogiri::HTML(response)
    html.search('#c7 .post').each do |post|
      Article.create!(
          header: post.search("h2 a").first.text.strip,
          perex: post.search("h3").first.text.strip,
          url: post.search("h2 a").first[:href].to_s.strip
      )
    end
  end
end
