require 'spec_helper'

RSpec.describe FacilityFactory do
   
    describe '.create_facility' do
         it 'can create facilities' do
            
            factory = FacilityFactory.new
            facility = [{name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}]
            dmv_test = factory.create_facilities(facility)
            
            
            expect(dmv_test.length).to eq(1)
            expect(dmv_test[0].name).to eq('DMV Tremont Branch')
            expect(dmv_test[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(dmv_test[0].phone).to eq('(720) 865-4600')
            
        end
     end
 end

