song1 = Song.create!(title: "One More Time", artist: "Daft Punk", user_id: 1, description: "One More Time!!", genre: nil, duration: nil)
song2 = Song.create!(title: "Aerodynamic", artist: "Daft Punk", user_id: 1, description: "Super dope yo", genre: "Electro Funk", duration: nil)

user1 = User.create!(email: "malcolm.carradine@gmail.com", password_digest: "$2a$10$KjunatZqQQKYUdLppkmkP.yEulNYgjIKSh0SxSsP5dkdJjEe5UObC",
                     username: "MalcolmCarradine", session_token: "oZpy_s6GS5xkoBwnxU743A", 
                     first_name: "Malcolm", last_name: "Carradine", full_name: nil, country: "USA", city: "New York City")
user2 = User.create!(email: "bob@music.com", password_digest: "$2a$10$F58288D4KPxKOLJwdJi2d.bGexM77mNRDocTSRmA/I.uo9hx6wu4S", 
                     username: nil, session_token: "K2iTnoW297tprOka_0YgsQ", 
                     first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil)
user3 = User.create!(email: "paul@wme.com", password_digest: "$2a$10$/O9XZlvuT0YbOa54SNq67e4JVZN7SIjJ8pUkYCdJgAEcQRTE0R4iW", 
                     username: nil, session_token: "eeQ0AI1G_Op31uwKDz3SPw", 
                     first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil)

follow1 = UserFollow.create!(follower_id: user1.id, following_id: user2.id)
follow2 = UserFollow.create!(follower_id: user1.id, following_id: user2.id)
