admin = User.first_or_create(email: "admin@netguru.co", password: "adminadmin", password_confirmation: "adminadmin", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true)
godfather = Movie.first_or_create(title: 'Godfather')

Movie.first_or_create(title: 'The Shawshank Redemption')
Movie.first_or_create(title: 'The Lord of the Rings: The Fellowship of the Ring')
Movie.first_or_create(title: 'The Dark Knight')
Movie.first_or_create(title: 'Fight club')
Movie.first_or_create(title: 'Inception')
Movie.first_or_create(title: 'Rambo')
Movie.first_or_create(title: 'The Silence of the Lambs')
Movie.first_or_create(title: 'Se7en')
Movie.first_or_create(title: 'Saving Private Ryan')

Review.first_or_create(content: 'ok', rating: 2, movie_id: godfather.id)