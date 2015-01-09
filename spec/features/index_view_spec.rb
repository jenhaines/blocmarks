require 'rails_helper'

include SessionHelpers

feature User do

  before do 
    @user = create(:user)
    # @topic = create(:topic)
    @bookmark = create(:bookmark, user: @user)
    @bookmark2 = create(:bookmark, user: create(:user))
  end

  scenario 'views index of personal bookmarks' do
      sign_in @user
      click_link "All My Topics"
      expect( page ).to have_content("Favorites")
  end

  scenario 'views index of all bookmarks' do
      sign_in @user
      click_link "All Topics"
      expect( page ).to have_content("All Topics")
  end

end