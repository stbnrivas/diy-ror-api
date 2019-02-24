class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :slug
end
