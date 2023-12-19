require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'User show page' do
    before(:each) do
      @user = User.create!(name: 'Landry', photo: '#photo_landry', bio: 'My bio #landry !', posts_counter: 0)

      10.times do |i|
        @post = Post.create(author: @user, title: "#{i}/ Post ", text: "This is my #{i} post")
      end

      visit user_path(@user.id)
    end

    after(:each) do
      User.destroy_all
    end

    it 'I can see the user"s profile picture' do
      expect(page.find("#user-#{@user.id}img")['src']).to have_content @user.photo
    end

    it 'I can see the user"s username.' do
      expect(page).to have_content @user.name
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(/Number of posts: 10/i)
    end

    it 'I can see the user"s bio' do
      expect(page).to have_content 'My bio #landry !'
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content('This is my 0 post', wait: 10)
      expect(page).to have_content('This is my 1 post', wait: 10)
      expect(page).to have_content('This is my 2 post', wait: 10)
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      visit user_path(@user.id)
      # Use `find` instead of `click_on` to make it more robust
      find('a', text: /See All Posts/i).click

      # Check the content on the redirected page
      (0..2).each do |i|
        # Removed the `wait` option from `have_content`
        expect(page).to have_content "This is my #{i} post"
      end
    end
  end
end
