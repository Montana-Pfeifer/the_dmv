require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'can register vehicles 25 years or older' do
      vehicle = Vehicle.new(vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice)
      
      registration_fee = @facility.register_vehicle(vehicle)
      expect(vehicle.plate_type).to eq(:antique)
      expect(registration_fee).to eq(25)
    end
  end

  describe '#register_vehicle' do
    it 'can sevice electic vehicles' do
       vehicle = Vehicle.new(vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev)

      registration_fee = @facility.register_vehicle(vehicle)
      expect(vehicle.plate_type).to eq(:ev)
      expect(registration_fee).to eq(200)
    end
  end

  describe '#register_vehicle' do
    it "can service regular vehicles" do
      vehicle = Vehicle.new(vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice)

      registration_fee = @facility.register_vehicle(vehicle)
      expect(vehicle.plate_type).to eq(:regular)
      expect(registration_fee).to eq(100)
    end  
  end


end
