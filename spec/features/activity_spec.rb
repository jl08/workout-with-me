require "rails_helper"

RSpec.feature "Activities Page", :type => :feature do
  let(:new_user_attr) { attributes_for(:user)}
  let(:register) {
    visit root_path
    click_link "Signup Here"
    fill_in 'Name', :with => new_user_attr[:name]
    fill_in 'Email', :with => new_user_attr[:email]
    fill_in 'Password', :with => new_user_attr[:password]
    page.choose('user_gender_male')
    fill_in 'Description', :with => new_user_attr[:description]
    find('#user_age').find(:xpath, 'option[2]').select_option
    click_button 'Register'
  }

  let(:create_activity) { create(:activity) }
  let(:activity_attr) { attributes_for(:activity) }

  before :each do
    register
    potential_user = create(:potential_user)
  end

  describe "create activities page" do
    scenario "should show all activities" do
      expect(page).to have_content("Select Your Activities")
    end

    scenario "should have button to create activities" do
      visit activities_path
      expect(page).to have_button("Create Activity")
    end

    scenario "should show images associated with activities" do
      visit activities_path
      expect(page).to have_selector("img[src$='#{}']")
    end

    # scenario "show error message if activity not chosen" do
    #   visit activities_path
    #   choose "user[:gender_preference]","Male"
    #   click_button 'Create Activity'
    #   expect(page).to have_content("Please fill in required fields")
    # end
  end
end