# frozen_string_literal: true
class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review_content, :book_id, :user_id
 #  def editable
 #    scope == object.user
 # end
end
