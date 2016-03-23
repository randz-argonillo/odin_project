require 'rails_helper'
require 'pry'

RSpec.describe "StaticPages", type: :request do
  describe "Home" do
    it "should have the content 'Sample App'" do
      binding.pry
      visit 'static_pages/home'
      expect(page).to have_selector('title', text: 'SampleApp')
    end
  end
end
