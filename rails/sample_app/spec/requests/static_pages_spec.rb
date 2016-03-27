require 'rails_helper'
require 'pry'

RSpec.describe "StaticPages", type: :request do
  describe "Home" do
    it "should have the content 'Sample App'" do
      visit '/'
      expect(page).to have_title('SampleApp')
    end
  end

  describe 'Contact' do 
    it "shows the contact page" do 
      visit '/contact'
      expect(page).to have_title('Contact')
    end
  end
end
