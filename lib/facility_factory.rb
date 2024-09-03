class FacilityFactory
    def create_facilities(facility)
        
        facility.map do |entry|
            Facility.new(
                name: entry[:name],
                address: entry[:address],
                phone: entry[:phone],
                )
        end
    end

    # def self.co_dmv_office_locations
    #     @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    #     create_facilities(co_dmv_office_locations)
    # end

end