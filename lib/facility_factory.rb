class FacilityFactory
    def create_facilities(entries, state)
        case state
        when :co
            create_facilities_for_co(entries)
        when :ny
            create_facilities_for_ny(entries)
        when :mo
            create_facilities_for_mo(entries)
        else
            "Unsuppourted #{state}"
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

    def create_facilities_for_ny(entries)
        entries.map do |entry|
            Facility.new(
                name: entry[:office_name],
                address: format_address_ny(entry),
                phone: entry[:public_phone_number]
            )
        end
    end

    def format_address_ny(entry)
        "#{entry[:street_address_line_1]}, #{entry[:city]}, #{entry[:state]}, #{entry[:zip_code]}"
    end

    def create_facilities_for_mo(entries)
        entries.map do |entry|
            Facility.new(
                name: entry[:name],
                address: format_address_mo(entry),
                phone: entry[:phone]
            )
        end
    end

    def format_address_mo(entry)
        "#{entry[:address1]}, #{entry[:city]}, #{entry[:state]}, #{entry[:zipcode]}"
    end
end