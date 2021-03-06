require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |name|
      name.owner == self
    end
  end

  def dogs
    Dog.all.select do |name|
      name.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |name|
      name.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |name|
      name.mood = "happy" 
    end
  end

  def sell_pets
    pets = dogs + cats
    pets.each do |name|
      name.mood = "nervous"
      name.owner = nil
    end
  #binding.pry
  end

  def list_pets 
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end