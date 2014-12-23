require 'rails_helper'

include SessionHelpers

feature User do

  before do 
    @user = create(:user)
    @bookmark = create(:bookmark, user: @user)
    @bookmark2 = create(:bookmark, user: create(:user))
  end

  scenario 'views index of personal bookmarks' do
      sign_in @user
      click_link "My Bookmarks"
      expect( page ).to have_content("#{@user.name}'s Bookmarks")
  end

  scenario 'views index of all bookmarks' do
      sign_in @user
      click_link "Community"
      expect( page ).to have_content("All Bookmarks")
  end

end