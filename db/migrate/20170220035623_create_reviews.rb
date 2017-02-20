# frozen_string_literal: true
class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :review_content

      t.references :user, index: true, foreign_key: true, null: false
      t.references :book, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
