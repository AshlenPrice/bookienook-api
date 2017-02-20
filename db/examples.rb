# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.transaction do
%w(antony jeff matt jason).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'abc123',
               password_confirmation: nil)
end
end

Review.create(review_content: 'this book was really awesome', book: books.first)
#
# Book.transaction do
#   %w().each do |name|
#     email = "#{name}@#{name}.com"
#     user = User.where(email: email).first
#     athlete_params = {
#       user_id: user.id,
#       given_name: name,
#       surname: 'Tufts',
#       date_of_birth: '1993-01-16'
#     }
#     next if Athlete.exists? athlete_params
#     Athlete.create! athlete_params
#   end
# end
#
# Workout.transaction do
#   %w(2kBenchmark 3668Benchmark 5kSS 10kSS 2500SS).each do |name|
#     workout_params = {
#       name: name
#     }
#     next if Workout.exists? workout_params
#     Workout.create! workout_params
#   end
# end
#
# Log.transaction do
#   require 'date'
#   date_time = DateTime.now
#
#   20.times do
#     log_params = {
#       workout: Workout.all.sample,
#       athlete: Athlete.all.sample,
#       date_completed: date_time
#     }
#
#     next if Log.exists? log_params
#     Log.create!(log_params)
#   end
# end
