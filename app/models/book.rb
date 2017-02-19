# frozen_string_literal: true

# Do I need validation here, since it's only index show

# :nodoc:
class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :grade_level, presence: true
  validates :description, presence: true
end
