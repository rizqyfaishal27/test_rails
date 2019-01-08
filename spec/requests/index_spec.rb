require 'rails_helper'

RSpec.describe 'Index page' do 
	describe 'GET /' do
		it 'should return response status ok' do 
			get '/'
			expect(response.status).to eql(200)
		end	
	end
end