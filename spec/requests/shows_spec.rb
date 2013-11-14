require 'spec_helper'

describe "Shows" do
	include Capybara::DSL
  after do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end

  describe "Shows" do
    it "should have shows list" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #visit shows_index_path
      visit '/'
      #response.status.should be(200)

      page.should have_content "Show List"
      page.should have_selector "h1", :text => "Show List"
      page.should have_link "New"
    end

    it "should be able to create new show" do
    	visit '/'
    	click_link "New"
    	current_path.should == '/shows/new'
    	page.should have_content "New Show"
    	page.should have_selector "label", :text => "Name"
    	page.should have_selector "label", :text => "Place"

    	fill_in "Name", :with => "NBA"
    	fill_in "Place", :with => "Boston"
    	click_button "Submit"

    	current_path.should == '/'
    	page.should have_content "NBA"
    	page.should have_content "Boston"
    	page.should have_link 'Edit'
    end
  end
end
