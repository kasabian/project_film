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
   Janr.create(name:"биографический")
   Janr.create(name:"боевик")
   Janr.create(name:"вестерн")
   Janr.create(name:"военный")
   Janr.create(name:"детектив")
   Janr.create(name:"детский")
   Janr.create(name:"документальный")
   Janr.create(name:"драма")
   Janr.create(name:"исторический")
   Janr.create(name:"комедия")
   Janr.create(name:"короткометражный")
   Janr.create(name:"криминал")
   Janr.create(name:"мелодрама")
   Janr.create(name:"мистика")
   Janr.create(name:"научный")
   Janr.create(name:"приключения")
   Janr.create(name:"семейный")
   Janr.create(name:"спорт")
   Janr.create(name:"триллер")
   Janr.create(name:"ужасы")
   Janr.create(name:"фантастика")
   Janr.create(name:"фэнтези")
   
#   
   
   Setting.create(site_name:"Онлайн кинотеатр",tegs:"фильмы, фильмы онлайн",count_page:16)