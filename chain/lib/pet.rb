# frozen_string_literal: true

class Pet
  attr_reader :type, :name, :hungry
  def initialize(type: 'Dog', name: '')
    @name = name
    @type = type
    @hungry = 100
  end

  attr_writer :name

  def eat
    (hungry += 10) > 100 ? 'i am not hungry' : hungry += 10
  end

  def play
    (hungry -= 15).negative? ? 'I cant play i need food' : hungry -= 15
  end
end
