class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :brief, :slug
end
