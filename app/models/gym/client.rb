

class Client
  attr_accessor :trainer
  attr_reader :name
  @@all =[]
  
  def initialize(hash)
    @name = hash[:name]
    @level = hash[:level]
    @signup_date = Time.now
    @@all << self
    @uid = self.class.count
  end

  def assign_trainer(trainer)
    self.trainer = trainer
  end

  def has_trainer?
    !!trainer
  end

  def locations
    trainer.locations
  end
  



  # CLASS VARIABLES
  def self.all
    @@all
  end

  def self.count
    all.count
  end
  

  def self.pick_random
    @@all.sample
  end
  
  def self.need_trainer
    all.select { |c| !c.has_trainer?}
  end
  
  


  
end