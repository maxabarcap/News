# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
    user.save
end

users = User.all

15.times do
    publication = Publication.new(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        user: users.sample
    )
    publication.save

    
    rand(2..4).times do
    comment = Comment.new(
        content: Faker::Lorem.sentence,
        user: users.sample,
        publication: publication
    )
    comment.save
    end
end