require 'rails_helper'

RSpec.describe 'root route' do
    it 'redirects to the welcome page' do
        get '/' 
        expect(response).to redirect_to(welcome_path)
        
        follow_redirect!
        expect(response.body).to include('Welcome')
    end
end