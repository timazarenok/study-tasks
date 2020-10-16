# frozen_string_literal: true

require_relative('pet.rb')

class Job
  attr_reader :salary
  def initialize(salary: 100)
    @salary = salary
  end

  def upSalary(value)
    @salary += value
  end

  def getMoney
    salary
  end
end

class Human
  def initialize(name: '', money: 0, job: Job.new, pet: Pet.new)
    @name = name
    @money = money
    @job = job
    @pet = pet
  end

  attr_reader :pet

  def nameDog(value)
    @pet.name = (value)
    "You are successfuly renamed your dog on name: #{@pet.name}"
  end

  def tryUpSalary
    if money >= 500
      @job.upSalary(200)
    else
      'Start working'
    end
  end

  def work
    @money += @job.getMoney
    'You get your salary'
  end

  def feedPet
    if (@money -= 5).negative?
      'You havent got enough money to feed, go work'
    else
      @money -= 5
      if @pet.eat == 'i am not hungry'
        money += 5
        'Pet is full'
      else
        'You feed pet'
      end
    end
  end
end
