class Facility
  attr_reader :name, :address, :phone, :services, :facilities

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @facilities = info[:facilities]
    @services = []
  end
  
  def add_service(service)
    @services << service
  end

  def facilities_offering_service(facilities, services)
    facilities.selct { |facility| facility.service.include?(service)}
  end

  def service_vehicle(vehicle)
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
    registration_fee
  end
end

