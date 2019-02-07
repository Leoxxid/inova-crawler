class Quote
  include Mongoid::Document

  field :quote, type: String
  field :author, type: String
  field :author_about, type: String

  embeds_many :tags
  embedded_in :search_tag
end
