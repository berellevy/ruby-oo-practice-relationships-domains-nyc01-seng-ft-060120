class TrainerLocation
  attr_reader :trainer, :location
  
  @@all = []

  def initialize(hash)
    @trainer = hash[:trainer]
    @location = hash[:location]
    check_for_duplicates
    @@all << self
    @id = self.class.count
  end
  
  def self.all
    @@all
  end

  def check_for_duplicates #raises error
    if self.class.all.any? { |tl| tl.trainer == self.trainer && tl.location == self.location}
      raise "Can't create a duplicate association!"
    end
  end
  

  def self.count
    all.count
  end
  
  
end