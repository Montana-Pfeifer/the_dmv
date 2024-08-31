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
end

