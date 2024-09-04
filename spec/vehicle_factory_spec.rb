require 'spec_helper'

RSpec.describe VehicleFactory do
   
   describe '.create_vehicles' do
        it 'can create vehicles' do

            factory = VehicleFactory.new
        entries_info = [{vin_1_10: "5YJYGDED6M", model_year: 2021, make: 'TESLA', model: 'Model Y', engine: :ev},
                        {vin_1_10: "WBY8P8C51K", model_year: 2019, make: 'BMW', model: 'i3', engine: :ev} 
        ]
        vehicles = factory.create_vehicles(entries_info)

        expect(vehicles.length).to eq(2)
        expect(vehicles[0].vin).to eq('5YJYGDED6M')
        expect(vehicles[0].year).to eq(2021)
        expect(vehicles[0].make).to eq('TESLA')
        expect(vehicles[0].model).to eq('Model Y')
        expect(vehicles[0].engine).to eq(:ev)
        expect(vehicles[1].vin).to eq('WBY8P8C51K')
        expect(vehicles[1].year).to eq(2019)
        expect(vehicles[1].make).to eq('BMW')
        expect(vehicles[1].model).to eq('i3')
        expect(vehicles[1].engine).to eq(:ev)
        end
    end
end