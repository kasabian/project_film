# ecoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   Type.create(name:"films")
   Type.create(name:"cartoons")
   
 #     
   Role.create(:name => :admin)
   Role.create(:name => :user)
   Role.create(:name => :other)
#    
   Janr.create(name:"фантастика")
   Janr.create(name:"комедия")
   Janr.create(name:"драма")
   Janr.create(name:"триллер")
   Janr.create(name:"фентези")
   
#   
   
   Setting.create(site_name:"Онлайн кинотеатр",tegs:"фильмы, фильмы онлайн",count_page:16)