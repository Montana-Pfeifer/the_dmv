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

it 'can determine if permit is T or F' do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1).to be_an_instance_of(Registrant)
    expect(registrant_2).to be_an_instance_of(Registrant)
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.name).to eq("Penny")
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit?).to eq(false)

end

it 'can read license data' do
    registrant_1 = Registrant.new("Bruce", 18, true)

    expect(registrant_1).to be_an_instance_of(Registrant)
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_1.license_data).to eq(:written=>false, :license=>false, :renew=>false)
end

end