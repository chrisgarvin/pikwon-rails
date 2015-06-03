# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

initialUser = User.create(:handle => "admin", :fname => "admin", :lname => "admin",
:email => "admin", :password => "admin", :password_confirmation => "admin")

initialPost = Post.new

initialOption1 = Option.create(:option_text => "Make a Pik")

initialPost.options << initialOption1


initialOption2 = Option.create(:option_text => "Don't make a Pik")

initialPost.options << initialOption2

initialUser.posts << initialPost

initialPost.save

initialUser.save
