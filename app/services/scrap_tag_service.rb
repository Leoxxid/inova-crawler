# frozen_string_literal: true

# Service to make scrapping
class ScrapTagService
  def initialize(params)
    @tag = params[:tag]
    @pages = params[:pages] || 1
    @quotes = []
    take_all_quotes
  end

  def call
    @search_tag = SearchTag.create(name: @tag) unless @quotes.empty?
    @quotes.flatten.each do |quote|
      take_quote_informations(quote)
      Quote.create_with_tags(@quote_informations, @search_tag)
    end
    @search_tag
  end

  private

  def take_all_quotes
    (1..@pages.to_i).each do |page|
      response = HTTParty.get(
        "http://quotes.toscrape.com/tag/#{@tag}/page/#{page}/"
      )
      doc = Nokogiri::HTML(response)
      quotes = doc.css('div.quote')
      break if quotes.empty?

      @quotes << quotes
    end
  end

  def take_quote_informations(quote)
    quote_text = quote.css('span.text').text
    author = quote.css('small.author').text
    author_about = quote.css('a:not([class])').first['href']
    tags = quote.css('a.tag').map(&:text)

    @quote_informations = {
      quote: quote_text,
      author: author,
      author_about: author_about,
      tags: tags
    }
  end
end
