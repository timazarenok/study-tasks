# frozen_string_literal: true

require('../lib/task.rb')
require 'rspec/autorun'
require 'faker'

describe Human do
  let(:pet) do
    Pet.new(type: 'Dog', name: 'Dimon')
  end

  let(:human) do
    Human.new(
      name: 'Egor',
      money: 100,
      job: Job.new(salary: 100),
      pet: pet
    )
  end

  it 'create Human' do
    expect(human).to be_kind_of(Human)
  end

  it 'Is human working' do
    expect(human.work).to eq('You get your salary')
  end

  it 'Is human get pet' do
    expect(human.pet).to eq(pet)
  end
end
