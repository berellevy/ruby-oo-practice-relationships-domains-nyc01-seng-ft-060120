class Trainer
  attr_reader :name
  @@all = []
  def initialize(hash)
    @name = hash[:name]
    @chest_size = hash[:chest_size]
    @@all << self
    @uid = self.class.count
  end


  def add_location(location)
    TrainerLocation.new(trainer: self, location: location)
  end
  
  def clients
    Client.all.select { |c| c.trainer == self }
  end

  def locations
    tl = TrainerLocation.all.select { |tl| tl.trainer == self }
    tl.map { |tl| tl.location }
  end
  
  

  # CLASS VARIABLES

  def self.all
    @@all
  end

  def self.count
    all.count
  end
  
  def self.pick_random
    all.sample
  end
  


  def self.most_clients
    all.max_by { |t| t.clients.count }
  end

  def self.client_count
    all.map { |t| {t.name.to_sym => t.clients.count} }
  end
  
end