require 'rails_helper'

RSpec.describe 'Create task page' do 
	describe 'GET /task/new' do
		it 'should return response status ok' do 
			get '/'
			expect(response.status).to eql(200)
		end	
	end
end