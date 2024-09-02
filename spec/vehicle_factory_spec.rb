require 'spec_helper'
require './lib/vehicle_factory'
require './lib/vehicle'

RSpec.describe VehicleFactory do

   describe '.create_vehicles' do
        it 'can create vehicles' do
        data = [{vin_1_10: '987654321abcdefgh', model_year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} ]

        vehicles = VehicleFactory.create_vehicles(data)

        expect(vehicles.length).to eq(1)
        expect(vehicles[0].vin).to eq('987654321abcdefgh')
        expect(vehicles[0].year).to eq(2019)
        expect(vehicles[0].make).to eq('Chevrolet')
        expect(vehicles[0].model).to eq('Bolt')
        expect(vehicles[0].engine).to eq(:ev)
        end
    end
end