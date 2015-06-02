# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

initialPost = Post.new

initialOption1 = Option.create(:option_text => "Make a Pik")

initialPost.options << initialOption1


initialOption2 = Option.create(:option_text => "Don't make a Pik")

initialPost.options << initialOption2

initialPost.save
