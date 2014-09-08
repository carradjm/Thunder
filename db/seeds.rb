PgSearch::Document.create!([
  {content: "Daft Punk", searchable_id: 5, searchable_type: "User"},
  {content: "Klingande", searchable_id: 1, searchable_type: "User"},
  {content: "Malcolm Carradine", searchable_id: 3, searchable_type: "User"},
  {content: "Around The World #<User:0x000001050134b0>", searchable_id: 1, searchable_type: "Song"},
  {content: "Da Funk - Daftendirekt #<User:0x000001037ba8f0>", searchable_id: 2, searchable_type: "Song"},
  {content: "Kygo", searchable_id: 4, searchable_type: "User"},
  {content: "M83 - Wait (Kygo Remix) #<User:0x0000010371a418>", searchable_id: 3, searchable_type: "Song"},
  {content: "Ellie Goulding - High For This (Kygo Remix) #<User:0x000001036c9ef0>", searchable_id: 4, searchable_type: "Song"},
  {content: "The Noisy Freaks", searchable_id: 2, searchable_type: "User"},
  {content: "The Noisy Freaks - Tonight (Original Mix) #<User:0x000001036134c0>", searchable_id: 5, searchable_type: "Song"},
  {content: "Stevie Wonder - Superstition (The Noisy Freaks Remix) #<User:0x000001035b8cc8>", searchable_id: 6, searchable_type: "Song"},
  {content: "Klingande - Jubel #<User:0x00000103559368>", searchable_id: 7, searchable_type: "Song"},
  {content: "Malcolm Carradine", searchable_id: 6, searchable_type: "User"},
  {content: "Kygo", searchable_id: 7, searchable_type: "User"},
  {content: "Ellie Goulding - High For This (Kygo Remix) #<User:0x0000010837e2a0>", searchable_id: 8, searchable_type: "Song"},
  {content: "M83 - Wait (Kygo Remix) #<User:0x00000102a81a80>", searchable_id: 9, searchable_type: "Song"},
  {content: "Passenger - Caravan (Kygo Remix) #<User:0x00000102278a00>", searchable_id: 10, searchable_type: "Song"},
  {content: "Daft Punk", searchable_id: 8, searchable_type: "User"},
  {content: "Da Funk - Daftendirekt #<User:0x00000102b42be0>", searchable_id: 11, searchable_type: "Song"},
  {content: "Around The World #<User:0x00000108445df0>", searchable_id: 12, searchable_type: "Song"},
  {content: "Klingande", searchable_id: 9, searchable_type: "User"},
  {content: "Klingande - Jubel #<User:0x0000010296fa70>", searchable_id: 13, searchable_type: "Song"}
])
Genre.create!([
  {name: "Rock"},
  {name: "Electronic"},
  {name: "Classical"},
  {name: "Pop"},
  {name: "Hip-Hop"},
  {name: "Easy-Listening"},
  {name: "Disco"},
  {name: "House"},
  {name: "Jazz"},
  {name: "Metal"},
  {name: "Folk"},
  {name: "Country"},
  {name: "Dance"},
  {name: "Alternative Rock"},
  {name: "Rap"},
  {name: "Singer-Songwriter"},
  {name: "R&B"}
])
User.create!([
  {id: 7, email: "kygo@kygo", password_digest: "$2a$10$XWUAVOE1So4xLNFrpuusgO6/MxrVQOuPBec5NnomShqc7smyGT62C", username: "Kygo", session_token: "V9HfAX79urBUhFSkYocgcA", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil, picture_file_name: "Kygo.jpg", picture_content_type: "image/jpeg", picture_file_size: 7057, picture_updated_at: "2014-09-08 19:36:59", user_follows_count: nil, songs_count: 3, notifications_count: nil, uid: nil, provider: nil},
  {id: 8, email: "daftpunk@france.com", password_digest: "$2a$10$Y82n4G9OoXhz7G2nQC9bFuP6mJVW0AkFewAtjVDdUF6yFTXXaoz2u", username: "Daft Punk", session_token: "qCnSg7DYhG7bAmtMZbs-wQ", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil, picture_file_name: "Daft-Punk.jpg", picture_content_type: "image/jpeg", picture_file_size: 329169, picture_updated_at: "2014-09-08 19:42:06", user_follows_count: nil, songs_count: 2, notifications_count: nil, uid: nil, provider: nil},
  {id: 9, email: "klingande@music.com", password_digest: "$2a$10$4QWzIrKhvu3hr3Hg9xCpie4KMFAjPbogc2l07.nbrCH0PZaP2rWn6", username: "Klingande", session_token: "QxgDQkiCa5PDQgDZgHIqCg", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil, picture_file_name: "Klingande.jpg", picture_content_type: "image/jpeg", picture_file_size: 36138, picture_updated_at: "2014-09-08 19:50:23", user_follows_count: nil, songs_count: 1, notifications_count: nil, uid: nil, provider: nil},
  {id: 6, email: "malcolm.carradine@gmail.com", password_digest: "$2a$10$9KJh2eW860QJrXilqvjfouP5NCy31fqCpRaC0gLup5Yi4jpWtp.D.", username: "Malcolm Carradine", session_token: "bt0YZCspbmAV705fuU1iSg", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil, picture_file_name: "malcolm_pic.jpg", picture_content_type: "image/jpeg", picture_file_size: 158758, picture_updated_at: "2014-09-08 19:36:37", user_follows_count: nil, songs_count: nil, notifications_count: nil, uid: nil, provider: nil}
])
Song.create!([
  {title: "Ellie Goulding - High For This (Kygo Remix)", user_id: 7, description: "", duration: nil, track_file_name: "High_For_This_(Kygo_Remix).mp3", track_content_type: "audio/mp3", track_file_size: 17856223, track_updated_at: "2014-09-08 19:38:26", image_file_name: "HighForThis.jpg", image_content_type: "image/jpeg", image_file_size: 54546, image_updated_at: "2014-09-08 19:38:46", genre_id: 13, song_likes_count: nil, shares_count: nil, comments_count: nil},
  {title: "M83 - Wait (Kygo Remix)", user_id: 7, description: "", duration: nil, track_file_name: "Wait_(Kygo_Remix).mp3", track_content_type: "audio/mp3", track_file_size: 12065502, track_updated_at: "2014-09-08 19:39:47", image_file_name: "waitremix.jpg", image_content_type: "image/jpeg", image_file_size: 96014, image_updated_at: "2014-09-08 19:40:00", genre_id: 13, song_likes_count: nil, shares_count: nil, comments_count: nil},
  {title: "Passenger - Caravan (Kygo Remix)", user_id: 7, description: "", duration: nil, track_file_name: "Passenger_-_Caravan_(Kygo_Remix).mp3", track_content_type: "audio/mp3", track_file_size: 4335377, track_updated_at: "2014-09-08 19:40:52", image_file_name: "KygoCaravan.jpg", image_content_type: "image/jpeg", image_file_size: 127900, image_updated_at: "2014-09-08 19:40:58", genre_id: 14, song_likes_count: nil, shares_count: nil, comments_count: nil},
  {title: "Da Funk - Daftendirekt", user_id: 8, description: "", duration: nil, track_file_name: "10_Da_Funk_-_Daftendirekt.mp3", track_content_type: "audio/mp3", track_file_size: 11020014, track_updated_at: "2014-09-08 19:42:41", image_file_name: "alive2007.jpg", image_content_type: "image/jpeg", image_file_size: 84741, image_updated_at: "2014-09-08 19:42:58", genre_id: 13, song_likes_count: nil, shares_count: nil, comments_count: nil},
  {title: "Around The World", user_id: 8, description: "", duration: nil, track_file_name: "07_Around_the_World.mp3", track_content_type: "audio/mp3", track_file_size: 4103839, track_updated_at: "2014-09-08 19:43:49", image_file_name: "around-the-world.jpeg", image_content_type: "image/jpeg", image_file_size: 67827, image_updated_at: "2014-09-08 19:44:02", genre_id: 2, song_likes_count: nil, shares_count: nil, comments_count: nil},
  {title: "Klingande - Jubel", user_id: 9, description: "", duration: nil, track_file_name: "Klingande_-_Jubel_(Official_Video_HD).mp3", track_content_type: "audio/mp3", track_file_size: 3345659, track_updated_at: "2014-09-08 19:51:36", image_file_name: "klingande-jubel.jpg", image_content_type: "image/jpeg", image_file_size: 22065, image_updated_at: "2014-09-08 19:51:46", genre_id: 13, song_likes_count: nil, shares_count: nil, comments_count: nil}
])
