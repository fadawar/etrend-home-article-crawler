require 'rails_helper'

RSpec.describe Category, :type => :model do
  it 'parse category from article' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/article-page.html', encoding: 'utf-8')

    Category.parse_categories(html)
    expect(Category.all.size).to eq(1)

    category = Category.first
    expect(category.name).to eq('Relax: Cestovanie')
    expect(category.url).to eq('http://relax.etrend.sk/relax-cestovanie.html')
  end
end
