require 'rails_helper'

RSpec.describe 'root route' do
    it 'displays the welcome page' do
        get '/' 
        expect(response).to be_successful
        expect(response.body).to include('Welcome')
    end
end