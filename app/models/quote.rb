class Quote
  include Mongoid::Document

  field :quote, type: String
  field :author, type: String
  field :author_about, type: String

  embeds_many :tags
  embedded_in :search_tag

  def self.create_with_tags(quote_informations, tag)
    quote = Quote.new(quote_informations.except(:tags))
    quote_informations[:tags].each do |quote_tag|
      quote.tags << Tag.new(name: quote_tag)
    end
    tag.quotes << quote
    tag.save
  end
end
