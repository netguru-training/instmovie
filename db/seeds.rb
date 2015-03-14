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