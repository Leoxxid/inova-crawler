class Quote
  include Mongoid::Document

  field :quote, type: String
  field :author, type: String
  field :author_about, type: String

  embeds_many :tags
  belongs_to :search_tag

  accepts_nested_attributes_for :tags
end
