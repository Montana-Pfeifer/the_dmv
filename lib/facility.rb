class Facility
  attr_reader :name, :address, :phone, :services, :facilities, :registered_vehicles, :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @facilities = info[:facilities]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end
  
  def add_service(service)
    @services << service
  end

  def facilities_offering_service(facilities, service)
    facilities.select { |facility| facility.service.include?(service)}
  end

  def register_vehicle(vehicle)
    if @services.empty?
      return nil
    end
    
    vehicle.registration_date = Date.today

    if vehicle.age >= 25
      vehicle.plate_type = :antique
      registration_fee = 25
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
      registration_fee = 200   
    else
      vehicle.plate_type = :regular
      registration_fee = 100
    end
    @registered_vehicles << vehicle
    @collected_fees += registration_fee
    registration_fee
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written]
      registrant.license_data[:license] = true
      return true
    else
      return false
    end
  end
end

