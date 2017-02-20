# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.create([
              { title: 'Stepping on the Cracks',
                author: 'Mary Downing Hahn',
                grade_level: '5th',
                description: 'The story of a conscientious objector
                              being sheltered during World War II.' },

              { title: 'Wayside School Is Falling Down',
                author: 'Louis Sachar',
                grade_level: '4th',
                description: 'One of several hilarious books about wacky Wayside
                              School.' },

              { title: 'The Very Hungry Caterpillar',
                author: 'Eric Carle',
                grade_level: 'Pre-K',
                description: 'The tale of a ravenous caterpillar who eats his
                              way through the week.' },
              { title: 'Goodnight Moon',
                author: 'Margaret Wise Brown',
                grade_level: 'Pre-K',
                description: 'The classic bedtime book' },

              { title: 'The Cat in the Hat',
                author: 'Dr. Seuss',
                grade_level: '1st',
                description: 'A silly tongue-twisting story, about a cat in a
                              hat.' }
            ])
