class QuoteSerializer < ActiveModel::Serializer
  attributes :quote, :author, :author_about

  has_many :tags do
    object.tags.map(&:name)
  end
end
