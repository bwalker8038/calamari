# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create :username => 'user' :email => 'user@example.com', :password => 'lawlz'

Category.create [{:name => 'Breakfast'},
                 {:name => 'Brunch'},
                 {:name => 'Lunch'},
                 {:name => 'Dinner'},
                 {:name => 'Desert'},
                 {:name => 'Snacks'},
                 {:name => 'Drinks'} ]
