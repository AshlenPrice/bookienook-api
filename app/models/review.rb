# frozen_string_literal: true
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, presence: true
  validates :user, presence: true
end
