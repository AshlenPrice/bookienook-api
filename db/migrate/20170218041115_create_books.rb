# frozen_string_literal: true

# does this require additional validation? would any of these fields be required?
# eventually as a stretch goal I want to be able to do a ful CRUD.

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :type, null: false
      t.integer :grade_level, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
