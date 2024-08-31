require './lib/registrant' #Require registrant.rb

RSpec.describe Registrant do

it 'it exists' do
    expect(registrant).be be_an_instance_of(Registrant)
end


end