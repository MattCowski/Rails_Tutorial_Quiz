require 'spec_helper'

# # home page should content sample app
# describe "StaticPages" do
#   describe "home page" do
#     it "should have content sample app" do
#       # get static_pages_home_path
#       visit '/static_pages/home'
#       expect(page).to have_content("Sample App")
#     end
#   end
# end



describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
      # to have title
    end
  end

  describe "help page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/help'
      expect(page).to have_content('help')
    end
  end

  describe "about page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/about'
      expect(page).to have_content('about')
    end
  end
end