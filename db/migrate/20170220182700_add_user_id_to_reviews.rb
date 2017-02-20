# frozen_string_literal: true
class AddUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, foreign_key: true
  end
end
