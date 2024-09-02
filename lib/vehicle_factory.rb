class VehicleFactory
    def self.create_vehicles(data)
        data.map do |entry|
        Vehicle.new(
            vin: entry[:vin],
            year: entry[:year],
            make: entry[:make],
            model: entry[:model],
            engine: :ev
        )
        end
    end
end