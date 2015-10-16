cody = User.new(email: "codywebber@gmail.com", name: "Cody Weber", password: "cody", age: 22, gender: "Male", description: "Looking for someone to lift with 6 times per week.  Like to lift before 9 each day", gender_preference: "no_preference")
cody.avatar = File.open(File.expand_path("../fixtures/pictures/cody.jpg", __FILE__))
cody.save

dian = User.new(email: "dianpan@gmail.com", name: "Dian Pan", password: "dian", age: 30, gender: "Female", description: "Looking for a spin partner and someone to go to some yoga classes with me.  Up for any night", gender_preference: "no_preference")
dian.avatar = File.open(File.expand_path("../fixtures/pictures/dian.jpg", __FILE__))
dian.save

frank = User.new(email: "frankimohel@gmail.com", name: "Frank Imohel", password: "frank", age: 23, gender: "Male", description: "Need someone to go to the gym with occasionally at night.  Also down to play pickup soccer", gender_preference: "no_preference")
frank.avatar = File.open(File.expand_path("../fixtures/pictures/frank.jpg", __FILE__))
frank.save


grant = User.new(email: "grantbarnekow@gmail.com", name: "Grant Barnekow", password: "grant", age: 23, gender: "Male", description: "Need someone to go to the gym with occasionally at night.  Also down to play pickup soccer", gender_preference: "no_preference")
grant.avatar = File.open(File.expand_path("../fixtures/pictures/grant.jpg", __FILE__))
grant.save


jenny = User.new(email: "leejenny0403@gmail.com", name: "Jenny Lee", password: "jenny", age: 25, gender: "Female", description: "Want to get back into tennis, who wants to come with me?", gender_preference: "no_preference")
jenny.avatar = File.open(File.expand_path("../fixtures/pictures/jenny.jpg", __FILE__))
jenny.save


julianna = User.new(email: "juliannarusakiewicz@gmail.com", name: "Julianna Rusakiewicz", password: "julianna", age: 31, gender: "Female", description: "I just wanna run and stretch! Who wants to join?", gender_preference: "no_preference")
julianna.avatar = File.open(File.expand_path("../fixtures/pictures/juilianna.jpg", __FILE__))
julianna.save


karl = User.new(email: "karlgrabbi@gmail.com", name: "Karl Grabbi", password: "karl", age: 23, gender: "Male", description: "I need to huge before spring break.  Chest and Bi's all day! LETSSS GOOOOO!!!!", gender_preference: "no_preference")
karl.avatar = File.open(File.expand_path("../fixtures/pictures/karl.jpg", __FILE__))
karl.save


maggie = User.new(email: "maggiegallagher@gmail.com", name: "Maggie Gallagher", password: "maggie", age: 24, gender: "Female", description: "Would love to have someone to go on runs a few night a week with me.  Also up good classes", gender_preference: "no_preference")
maggie.avatar = File.open(File.expand_path("../fixtures/pictures/maggie.jpg", __FILE__))
maggie.save


mark = User.new(email: "mark.kilpatrick.miller@gmail.com", name: "Mark Miller", password: "mark", age: 24, gender: "Male", description: "Need a new lifting partner since I moved to NYC.  I'm down any night of the week.  I'd also like to play ball occasionally.", gender_preference: "no_preference")
mark.avatar = File.open(File.expand_path("../fixtures/pictures/mark.jpg", __FILE__))
mark.save


marymargaret = User.new(email: "marymargarettonner@gmail.com", name: "Marymargaret Tonner", password: "marymargaret", age: 21, gender: "Female", description: "need to start running more and lifting a few nights a week", gender_preference: "no_preference")
marymargaret.avatar = File.open(File.expand_path("../fixtures/pictures/marymargaret.jpg", __FILE__))
marymargaret.save


navraj = User.new(email: "nnat425@gmail.com", name: "Navraj Nat", password: "navraj", age: 22, gender: "Male", description: "Looking to get back into the gym.  I know the basics but am looking for someone trying to get toned for beach body season", gender_preference: "no_preference")
navraj.avatar = File.open(File.expand_path("../fixtures/pictures/navraj.jpg", __FILE__))
navraj.save


nick = User.new(email: "nickferraro@gmail.com", name: "Nick Ferraro", password: "nick", age: 23, gender: "Male", description: "I hit the gym 4 nights a week and run every other. Would love a partner to push me (evalavation masks encouraged)", gender_preference: "no_preference")
nick.avatar = File.open(File.expand_path("../fixtures/pictures/nick.jpg", __FILE__))
nick.save


tommy = User.new(email: "tommyeastman@gmail.com", name: "Tommy Eastman", password: "tommy", age: 23, gender: "Male", description: "Need to get back into the gym.  Also want to get back into yoga.", gender_preference: "no_preference")
tommy.avatar = File.open(File.expand_path("../fixtures/pictures/tommy.jpg", __FILE__))
tommy.save


zach = User.new(email: "zachweiss@gmail.com", name: "Zach Weiss", password: "zach", age: 19, gender: "Male", description: "If you're down for 5am lifts or 9pm runs give me shout", gender_preference: "no_preference")
zach.avatar = File.open(File.expand_path("../fixtures/pictures/zach.jpg", __FILE__))
zach.save

cody.locations.create(latitude: 40.748817, longitude: -73.985428)
dian.locations.create(latitude: 40.548812, longitude: -73.985421)
frank.locations.create(latitude: 40.248817, longitude: -73.985422)
grant.locations.create(latitude: 40.743817, longitude: -73.985423)
jenny.locations.create(latitude: 40.749817, longitude: -73.985424)
julianna.locations.create(latitude: 40.749817, longitude: -73.985425)
karl.locations.create(latitude: 40.748817, longitude: -73.985426)
maggie.locations.create(latitude: 40.742187, longitude: -73.985427)
mark.locations.create(latitude: 40.741117, longitude: -73.9854288)
marymargaret.locations.create(latitude: 40.478817, longitude: -73.985429)
navraj.locations.create(latitude: 40.748777, longitude: -73.985418)
nick.locations.create(latitude: 40.749117, longitude: -73.985420)
tommy.locations.create(latitude: 41.748817, longitude: -73.985419)
zach.locations.create(latitude: 39.748817, longitude: -73.985410)

lifting = Activity.create(name: "Lifting")
tennis = Activity.create(name: "Tennis")
basketball = Activity.create(name: "Basketball")
spin = Activity.create(name: "Spin")
soccer = Activity.create(name: "Soccer")
running = Activity.create(name: "Running")
crossfit = Activity.create(name: "Crossfit")
yoga = Activity.create(name: "Yoga")
hiking = Activity.create(name: "Hiking")
racquetball = Activity.create(name: "Racquetball")

cody.activities << lifting
cody.activities << basketball
cody.activities << crossfit

dian.activities << yoga
dian.activities << spin
dian.activities << tennis

grant.activities << lifting
grant.activities << crossfit
grant.activities << basketball

frank.activities << lifting
frank.activities << basketball
frank.activities << soccer
frank.activities << racquetball

jenny.activities << tennis
jenny.activities << lifting
jenny.activities << running

julianna.activities << running
julianna.activities << yoga

karl.activities << lifting
karl.activities << basketball
karl.activities << crossfit

maggie.activities << running
maggie.activities << yoga
maggie.activities << hiking

mark.activities << lifting
mark.activities << basketball
mark.activities << spin

marymargaret.activities << lifting
marymargaret.activities << spin
marymargaret.activities << running

navraj.activities << lifting
navraj.activities << basketball
navraj.activities << soccer

nick.activities << lifting
nick.activities << running

tommy.activities << lifting
tommy.activities << yoga

zach.activities << running
zach.activities << lifting



# for x in 0..100
#   if x % 2 == 1
#     new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8), age: Faker::Number.between(15, 45), gender: "Male", description: Faker::Hacker.say_something_smart)
#     new_user.activities << lifting
#   else
#     new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8), age: Faker::Number.between(15, 45), gender: "Female", description: Faker::Hacker.say_something_smart)
#     new_user.activities << spin
#   end
#   new_user.locations.create(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
#   if x % 7 == 0
#     new_user.activities << tennis
#     new_user.activities << running
#   end
#   if x % 4 == 0
#     new_user.activities << basketball
#   end
#   if x % 11 == 0
#     new_user.activities << soccer
#   end
# end

Location.where(latitude: nil, longitude: nil).each do |location|
    location.destroy
  end