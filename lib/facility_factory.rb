class FacilityFactory
    def create_facilities(entries, state)
        case state
        when :co
            create_facilities_for_co(entries)
        else
            raise "Unsuppourted state #{state}"
        end
    end

    def create_facilities_for_co(entries)
        entries.map do |entry|
            Facility.new(
                name: entry[:dmv_office],
                address: format_address_co(entry),
                phone: entry[:phone],
                )
        end
    end

    def format_address_co(entry)
        "#{entry[:address_li]}, #{entry[:address__1]}, #{entry[:city]}, #{entry[:state]}, #{entry[:zip]}"
    end
end