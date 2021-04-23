# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Location.delete_all
Event.delete_all

User.create(:email => 'margerysmith@gmail.com', :name => 'Margery Smith', :username => 'margiesmith', :bio => 'PTA president and proud honor student mom', :password => 'password') #1
User.create(:email => 'dantheman@aol.com', :name => 'Dan Johnson', :username => 'DanTheMan', :bio => 'Dan, the cool parent', :password => 'password') #2
User.create(:email => 'simianmike@yahoo.com', :name => 'Mike Sims', :username => 'ScoutingGuy', :bio => 'Troop Leader of troop 123. Join boy scouts please.', :password => 'password') #3
User.create(:email => 'jessywalters@gmail.com', :name => 'Jessica Walters', :username => 'JessTheHiker', :bio => 'Hiking instructor and camping enthusiast!', :password => 'password') #4
User.create(:email => 'lukevangorder@gmail.com', :name => 'Luke VanGorder', :username => 'lukevangorder', :bio => "Town's founder and the only real person here", :password => 'password') #5

Location.create(:name => 'Flatiron High School', :address => '123 Flatiron Blvd.', :info => 'Local high school. Go fighting code students!')
Location.create(:name => 'Alum Creek Campground', :address => '123 The Woods Ave', :info => 'Camp ground at Alum Creek State Park. Bring your smores!')
Location.create(:name => 'Main Street Plaza', :address => '123 Main Street', :info => "The Central Plaza of the town that this project's creator made up.")

Event.create(:name => 'Debate Team Bake Sale', :info => 'Come support the Debate team as they make their way to semi-regionial super semi-finals and get a delicous treat while you do!', :starts_at => Time.new(2021, 4, 6, 12, 00, 00), :ends_at => Time.new(2021, 4, 6, 14, 00, 00), :location_id => 1, :user_id => 1)
Event.create(:name => 'Annual Track Meet', :info => 'Join the Flatiron High School runners as they compete at our yearly invitiational track meet. Lets go fighting mongooses!', :starts_at => Time.new(2021, 4, 8, 13, 00, 00), :ends_at => Time.new(2021, 4, 8, 15, 00, 00), :location_id => 1, :user_id => 1)
Event.create(:name => 'Tailgating the Big Game', :info => 'Do you know which game it is? No. Do you even know which sport it is? No. Dan the Man is makin burgers and brats, BYOB', :starts_at => Time.new(2021, 4, 12, 18, 00, 00), :ends_at => Time.new(2021, 4, 12, 22, 00, 00), :location_id => 1, :user_id => 2)
Event.create(:name => 'Boy Scouts Camporee', :info => 'Earn some merit badges and whittle while you wait at the camporee to end all camporees! We swear boy scouts are cool.', :starts_at => Time.new(2021, 4, 16, 12, 00, 00), :ends_at => Time.new(2021, 4, 18, 12, 00, 00), :location_id => 2, :user_id => 3)
Event.create(:name => 'Muscle Car Show', :info => 'Vroom vroom', :starts_at => Time.new(2021, 4, 20, 12, 00, 00), :ends_at => Time.new(2021, 4, 20, 15, 00, 00), :location_id => 3, :user_id => 3)
Event.create(:name => 'Trailblazing Mega Hike', :info => 'A grueling 23.2 mile hike through dangerous terrain, a true test of endurance for even the mightest of hikers.', :starts_at => Time.new(2021, 5, 1, 8, 00, 00), :ends_at => Time.new(2021, 5, 1, 18, 00, 00), :location_id => 2, :user_id => 4)
Event.create(:name => 'Learn the Backpack Today!', :info => 'Ever wanted to learn how to backpack? Well nows your chance! The class costs a measely $800! Cant wait to see you there!', :starts_at => Time.new(2021, 5, 3, 12, 00, 00), :ends_at => Time.new(2021, 5, 4, 18, 00, 00), :location_id => 2, :user_id => 4)
Event.create(:name => 'Luke Day Parade', :info => 'I made the program, I get to throw a parade for myself', :starts_at => Time.new(2021, 7, 29, 1, 00, 00), :ends_at => Time.new(2021, 7, 29, 23, 59, 00), :location_id => 3, :user_id => 5)