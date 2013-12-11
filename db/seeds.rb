# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

images = [
	'one.jpg',
	'two.jpg',
	'three.jpg',
	'four.jpg',
	'five.jpg',
	'six.jpg',
	'seven.jpg',
	'eight.jpg',
	'nine.jpg',
]

images.each do |f|
	piece = ContentPiece.new
	piece.url = "app/assets/" + f
	piece.format = 'img'
	piece.thumb_url ='app/assets/thumbs/' + f
	piece.save!
end

	piece = ContentPiece.new
	piece.url = "app/assets/india2.mp4"
	piece.format = 'video'
	piece.thumb_url ='app/assets/thumbs/india2.jpg'
	piece.save!
