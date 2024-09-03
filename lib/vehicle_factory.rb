class VehicleFactory
    def create_vehicles(entries)
        entries.map do |entry|
        Vehicle.new(
            vin: entry[:vin_1_10],
            year: entry[:model_year],
            make: entry[:make],
            model: entry[:model],
            engine: :ev
        )
        end
    end
end