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
	piece.url = "content_pieces/" + f
	piece.format = 'img'
	piece.thumb_url ='content_pieces/thumbs/' + f
	piece.save!
end
