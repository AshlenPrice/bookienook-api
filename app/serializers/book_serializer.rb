# frozen_string_literal: true

# :nodoc:

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :grade_level, :description
end
