Song.create!([
  {title: "One More Time", artist: "Daft Punk", user_id: 1, description: "One More Time!!", genre: nil, duration: nil},
  {title: "Aerodynamic", artist: "Daft Punk", user_id: 1, description: "Super dope yo", genre: "Electro Funk", duration: nil}
])
User.create!([
  {email: "bob@music.com", password_digest: "$2a$10$F58288D4KPxKOLJwdJi2d.bGexM77mNRDocTSRmA/I.uo9hx6wu4S", username: nil, session_token: "K2iTnoW297tprOka_0YgsQ", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil},
  {email: "paul@wme.com", password_digest: "$2a$10$/O9XZlvuT0YbOa54SNq67e4JVZN7SIjJ8pUkYCdJgAEcQRTE0R4iW", username: nil, session_token: "eeQ0AI1G_Op31uwKDz3SPw", first_name: nil, last_name: nil, full_name: nil, country: nil, city: nil},
  {email: "malcolm.carradine@gmail.com", password_digest: "$2a$10$KjunatZqQQKYUdLppkmkP.yEulNYgjIKSh0SxSsP5dkdJjEe5UObC", username: "MalcolmCarradine", session_token: "oZpy_s6GS5xkoBwnxU743A", first_name: "Malcolm", last_name: "Carradine", full_name: nil, country: "USA", city: "New York City"}
])
UserFollow.create!([
  {follower_id: 1, following_id: 2},
  {follower_id: 1, following_id: 3}
])
