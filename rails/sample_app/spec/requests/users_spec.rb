require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'signup' do 
    it "will show the signup page" do 
      visit '/signup'
      expect(page).to have_title('Signup')
    end
  end
end