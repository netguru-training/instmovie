godfather = Movie.where(title: 'Godfather', instagram_tag: 'godfathermovie').first_or_create
shawshank = Movie.where(title: 'The Shawshank Redemption', instagram_tag: 'shawshankredemption').first_or_create
lotr = Movie.where(title: 'The Lord of the Rings: The Fellowship of the Ring', instagram_tag: 'lotrmovie').first_or_create
dark_knight = Movie.where(title: 'The Dark Knight', instagram_tag: 'darkknightmovie').first_or_create
fight_club = Movie.where(title: 'Fight club', instagram_tag: 'fightclubmovie').first_or_create
inception = Movie.where(title: 'Inception', instagram_tag: 'inceptionmovie').first_or_create
rambo = Movie.where(title: 'Rambo', instagram_tag: 'rambomovie').first_or_create
silence = Movie.where(title: 'The Silence of the Lambs', instagram_tag: 'thesilenceofthelambs').first_or_create
seven = Movie.where(title: 'Se7en', instagram_tag: 'sevenmovie').first_or_create
ryan = Movie.where(title: 'Saving Private Ryan', instagram_tag: 'savingprivateryan').first_or_create

User.where(email: "admin@netguru.co").first_or_create(password: "adminadmin", admin: true)
User.where(email: 'john@doe.com').first_or_create(password: 'pass2word')
User.where(email: 'foo@bar.com').first_or_create(password: 'foo4barcode')
User.where(email: 'jan@kowal.ski').first_or_create(password: 'jan_kowal')
User.where(email: 'robert@bara.theon').first_or_create(password: 'ours_is_fury')
User.where(email: 'jaime@lanni.ster').first_or_create(password: 'golden_hair')

Movie.where(title: 'Godfather').first_or_create
Movie.where(title: 'The Shawshank Redemption').first_or_create
Movie.where(title: 'The Lord of the Rings: The Fellowship of the Ring').first_or_create
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

Review.where(content: 'OK.', rating: 2, movie_id: godfather.id).first_or_create
Review.where(content: 'Will do.', rating: 3, movie_id: godfather.id).first_or_create
Review.where(content: 'Cool.', rating: 4, movie_id: godfather.id).first_or_create

Review.where(content: 'Could be better.', rating: 2, movie_id: shawshank.id).first_or_create
Review.where(content: 'Would recommend.', rating: 5, movie_id: shawshank.id).first_or_create
Review.where(content: 'One can watch it.', rating: 3, movie_id: shawshank.id).first_or_create

Review.where(content: 'Nice.', rating: 4, movie_id: lotr.id).first_or_create
Review.where(content: 'Neat!', rating: 5, movie_id: lotr.id).first_or_create
Review.where(content: 'I liked it.', rating: 5, movie_id: lotr.id).first_or_create
Review.where(content: 'i loved it!', rating: 5, movie_id: lotr.id).first_or_create

Review.where(content: 'Dunno...', rating: 3, movie_id: dark_knight.id).first_or_create
Review.where(content: 'Not for me.', rating: 2, movie_id: dark_knight.id).first_or_create

Review.where(content: 'I can\'t speak about it.', rating: 4, movie_id: fight_club.id).first_or_create
Review.where(content: 'Liking it.', rating: 4, movie_id: fight_club.id).first_or_create
Review.where(content: 'Can\'t wait for the sequel.', rating: 5, movie_id: fight_club.id).first_or_create

Review.where(content: 'I can\'t go too deep in this review.', rating: 4, movie_id: inception.id).first_or_create
Review.where(content: 'Mindblowing...', rating: 5, movie_id: inception.id).first_or_create
Review.where(content: 'It\'s something!', rating: 5, movie_id: inception.id).first_or_create

Review.where(content: 'Classic.', rating: 4, movie_id: rambo.id).first_or_create
Review.where(content: 'Rambo 2 is better.', rating: 3, movie_id: rambo.id).first_or_create

Review.where(content: 'Scary enough.', rating: 4, movie_id: silence.id).first_or_create
Review.where(content: 'Is this based on a true story?', rating: 3, movie_id: silence.id).first_or_create
Review.where(content: 'I have to watch it again sometimes.', rating: 4, movie_id: silence.id).first_or_create

Review.where(content: 'Was is meant funny?', rating: 2, movie_id: seven.id).first_or_create
Review.where(content: 'So deep!', rating: 5, movie_id: seven.id).first_or_create
Review.where(content: 'A well crafted artwork.', rating: 5, movie_id: seven.id).first_or_create

Review.where(content: 'Not very accurate.', rating: 2, movie_id: ryan.id).first_or_create
Review.where(content: 'Tom Hanks rocks!', rating: 5, movie_id: ryan.id).first_or_create
