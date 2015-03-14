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

User.where(email: "admin@netguru.co").first_or_create(password: "adminadmin", password_confirmation: "adminadmin", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true)
User.where(email: 'john@doe.com').first_or_create(password: 'pass2word')
User.where(email: 'foo@bar.com').first_or_create(password: 'foo4barcode')
User.where(email: 'jan@kowal.ski').first_or_create(password: 'jan_kowal')
User.where(email: 'robert@bara.theon').first_or_create(password: 'ours_is_fury')
User.where(email: 'jaime@lanni.ster').first_or_create(password: 'golden_hair')

Movie.where(title: 'Godfather').first_or_create
Movie.where(title: 'The Shawshank Redemption').first_or_create
Movie.where(title: 'The Lord of the Rings: The Fellowship of the Ring')
Movie.where(title: 'The Dark Knight').first_or_create
Movie.where(title: 'Fight club').first_or_create
Movie.where(title: 'Inception').first_or_create
Movie.where(title: 'Rambo').first_or_create
Movie.where(title: 'The Silence of the Lambs').first_or_create
Movie.where(title: 'Se7en').first_or_create
Movie.where(title: 'Saving Private Ryan').first_or_create

Tag.where(name: 'Drama').first_or_create
Tag.where(name: 'Comedy').first_or_create
Tag.where(name: 'Crime').first_or_create
Tag.where(name: 'Thriller').first_or_create
Tag.where(name: 'Horror').first_or_create
Tag.where(name: 'Adventure').first_or_create
Tag.where(name: 'Action').first_or_create
Tag.where(name: 'Fantasy').first_or_create
Tag.where(name: 'Sci-Fi').first_or_create
Tag.where(name: 'Biography').first_or_create
Tag.where(name: 'History').first_or_create
Tag.where(name: 'Romance').first_or_create
Tag.where(name: 'Documentary').first_or_create
Tag.where(name: 'War').first_or_create
Tag.where(name: 'Musical').first_or_create
Tag.where(name: 'Mystery').first_or_create

Review.where(content: 'ok', rating: 2, movie_id: godfather.id).first_or_create
Review.where(content: 'will do', rating: 3, movie_id: godfather.id).first_or_create
Review.where(content: 'cool', rating: 4, movie_id: godfather.id).first_or_create