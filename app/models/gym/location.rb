


class Location
  attr_reader :city
  @@all = []
  def initialize(city)
    @city = city
    @open_date = Time.now
    @@all << self
    @uid = self.class.count
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.pick_random
    all.sample
  end
  
  

  def self.least_clients
    all.min_by { |l| l.clients.count}
  end
  
  def self.client_count
    all.map { |l| {l.city => l.clients.count}}
  end
  

  def trainers
    tl = TrainerLocation.all.select { |tl| tl.location == self }
    tl.map { |tl| tl.trainer }
  end
  
  def clients
    trainers.map { |t| t.clients }.flatten
  end
  
end

