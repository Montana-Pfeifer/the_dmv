require './lib/registrant' #Require registrant.rb

RSpec.describe Registrant do

it 'it exists' do
    registrant = Registrant.new("Bruce", 18, true)
end

it "can have a name and age" do

    registrant = Registrant.new("Bruce", 18, true)

    expect(registrant).to be_an_instance_of(Registrant)
    expect(registrant.name).to eq("Bruce")
    expect(registrant.age).to eq(18)
end

it 'can have a permit' do
    registrant = Registrant.new("Bruce", 18, true)

    expect(registrant).to be_an_instance_of(Registrant)
    expect(registrant.name).to eq("Bruce")
    expect(registrant.age).to eq(18)
    expect(registrant.permit).to eq(true)
end
end