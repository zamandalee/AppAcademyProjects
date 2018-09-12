# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all 

users = User.create([{username: 'U1'}, {username: 'U2'}, {username: 'U3'}, {username: 'U4'}])

artworks = Artwork.create([{title: 'A1', artist_id: 1, image_url: 'a1.com'}, {title: 'A2', artist_id: 1, image_url: 'a2.com'}, {title: 'A3', artist_id: 3, image_url: 'a3.com'}, {title: 'A4', artist_id: 4, image_url: 'a4.com'}])

artwork_shares = ArtworkShare.create([{viewer_id: 1, artwork_id: 3}, {viewer_id: 2, artwork_id: 1}, {viewer_id: 2, artwork_id: 2}, {viewer_id: 3, artwork_id: 4}])
