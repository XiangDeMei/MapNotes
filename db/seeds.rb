# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t1 = Tag.create(name:"a")
t2 = Tag.create(name:"b")
t3 = Tag.create(name:"c")
n = Note.create(title: "test", user_id: 1, latitude:29.9090876153, longitude:121.6371381786, content: "ttdsddddddd", tags:[t1,t2,t3])
