require 'rails_helper'

RSpec.describe Article, :type => :model do
  it 'parses articles' do
    #html = Faraday.get('http://www.etrend.sk/').body
    html = File.read(File.dirname(__FILE__) + '/fixtures/etrend-title-page.html', encoding: 'utf-8')

    Article.parse_articles(html)
    expect(Article.count).not_to eq(0)

    article = Article.first
    expect(article.header).to eq('Putinovi sa zapáčil hazard. Okrem Krymu má byť Las Vegas aj zo Soči')
    expect(article.perex).to eq('Týmto krokom chce Rusko podporiť turizmus v ľudoprázdnom meste, aby sa vyrovnala strata z olympiády')
    expect(article.url).to eq('http://relax.etrend.sk/relax-cestovanie/putinovi-sa-zapacil-hazard-okrem-krymu-ma-byt-las-vegas-aj-zo-soci.html')
  end
end
