# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
admin = User.create!(email: "admin@netguru.co", password: "adminadmin", password_confirmation: "adminadmin", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true)
Movie.create!(title: 'Godfather')
Movie.create!(title: 'The Shawshank Redemption')
Movie.create!(title: 'The Lord of the Rings: The Fellowship of the Ring')
Movie.create!(title: 'The Dark Knight')
Movie.create!(title: 'Fight club')
Movie.create!(title: 'Inception')
Movie.create!(title: 'Rambo')
Movie.create!(title: 'The Silence of the Lambs')
Movie.create!(title: 'Se7en')
Movie.create!(title: 'Saving Private Ryan')