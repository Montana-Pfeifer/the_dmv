require 'spec_helper'

RSpec.describe FacilityFactory do
   let (:factory){FacilityFactory.new}

    describe '.create_facilities' do
         xit 'can create' do
            
            factory = FacilityFactory.new
            facility = [{name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}]
            dmv_test = factory.create_facilities(facility)
            
            
            expect(dmv_test.length).to eq(1)
            expect(dmv_test[0].name).to eq('DMV Tremont Branch')
            expect(dmv_test[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(dmv_test[0].phone).to eq('(720) 865-4600')
            
        end
     end

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
    
 end

