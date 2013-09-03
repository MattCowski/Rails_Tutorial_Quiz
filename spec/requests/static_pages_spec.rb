require 'spec_helper'



describe "Static pages" do
  let(:title){"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
      # to have title
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{title}")
    end


    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
    
  end

  describe "help page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{title} | help")
    end
  end

  describe "about page" do

    it "should have the content 'about'" do
      visit '/static_pages/about'
      expect(page).to have_content('about')
      expect(page).to have_title("#{title} | about")
    end
  end
end