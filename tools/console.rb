require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

names = [
  "harry",
  'larry',
  'garry',
  'mary',
  'sary',
  'glen',
  'gwen',
  'ben',
  'sven'
]

levels = [
  'wimp',
  'beginner',
  'intermediate',
  'hunk',
  'lunk',
  'pro bodybuilder'
]

locations = [
  'brooklyn',
  'fidi',
  'soha',
  'wahi',
  'nolita',
  'sobushi',
  'eaneyo'
]


# let's make some trainers and clients
6.times do
  Trainer.new(name: names.sample, chest_size: rand(40..60))
  Client.new(name: names.sample, level: levels.sample)
  Client.new(name: names.sample, level: levels.sample)
end

# let's make the locations
locations.each { |l| Location.new(l) }

# Let's link some trainers to locations!

Trainer.all.each do |t|
  rand(5).times do 
    begin
      t.add_location(Location.pick_random)
    rescue
      next
    end
  end
end


# Let's link some clients with some trainers!!!

Client.all.each { |c| c.assign_trainer(Trainer.pick_random)}


Client.all


Pry.start
