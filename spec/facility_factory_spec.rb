require 'spec_helper'

RSpec.describe FacilityFactory do
   let (:factory){FacilityFactory.new}

    describe '#format_address_co' do
     it 'formats a Colorado address correctly' do
       entry = { address_li: "2855 Tremont Place", address__1: "Suite 118", city: "Denver", state: "CO", zip: "80205"}
 
       formatted_address = factory.send(:format_address_co, entry)
 
       expect(formatted_address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
     end
   end

    describe '.create_facilities_for_co'
     it 'can create a facility list for co' do
        co_entries = [{ dmv_office: "DMV Tremont Branch", address_li: "2855 Tremont Place", address__1: "Suite 118", city: "Denver", state: "CO", zip: "80205",phone: "(720) 865-4600"},
        {dmv_office: "DMV Northeast Branch", address_li: "4685 Peoria Street", address__1: "Suite 101", city: "Denver", state: "CO", zip: "80239",phone: "(720) 865-4600"}
        ]

        facilities = factory.create_facilities(co_entries, :co)

        expect(facilities.length).to eq(2)

        expect(facilities[0].name).to eq("DMV Tremont Branch")
        expect(facilities[0].address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
        expect(facilities[0].phone).to eq("(720) 865-4600")

        expect(facilities[1].name).to eq("DMV Northeast Branch")
        expect(facilities[1].address).to eq("4685 Peoria Street, Suite 101, Denver, CO, 80239")
        expect(facilities[1].phone).to eq("(720) 865-4600")
    end
    
    describe '#format_address_ny' do
     it 'formats a New York address correctly' do
       entry = { street_address_line_1: "560 WARREN STREET", city: "HUDSON", state: "NY", zip_code: "12534"}
 
       formatted_address = factory.send(:format_address_ny, entry)
 
       expect(formatted_address).to eq("560 WARREN STREET, HUDSON, NY, 12534")
     end
   end
   describe '.create_facilities_for_ny'
     it 'can create a facility list for ny' do
        ny_entries = [{office_name: "HUDSON", street_address_line_1: "560 WARREN STREET", city: "HUDSON", state: "NY", zip_code: "12534", public_phone_number: "5188283350"},
        {office_name: "ROCHESTER DOWNTOWN", street_address_line_1: "200 E. MAIN STREET", city: "ROCHESTER", state: "NY", zip_code: "14604", public_phone_number:"5852594526"}
        ]

        facilities = factory.create_facilities(ny_entries, :ny)

        expect(facilities.length).to eq(2)

        expect(facilities[0].name).to eq("HUDSON")
        expect(facilities[0].address).to eq("560 WARREN STREET, HUDSON, NY, 12534")
        expect(facilities[0].phone).to eq("5188283350")

        expect(facilities[1].name).to eq("ROCHESTER DOWNTOWN")
        expect(facilities[1].address).to eq("200 E. MAIN STREET, ROCHESTER, NY, 14604")
        expect(facilities[1].phone).to eq("5852594526")
    end
 end

