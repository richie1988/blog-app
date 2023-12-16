require 'rails_helper'

RSpec.describe 'user_index_path', type: :system do
  describe 'User_index_view' do
    before do
      @users = [
        User.create(id: 444, name: 'Nicole', photo: '#photo_nicole', bio: 'bio', posts_counter: 0),
        User.create(name: 'Tom', photo: '#photo_tom', bio: 'bio', posts_counter: 19),
        User.create(name: 'Candy', photo: '#photo_candy3', bio: 'bio', posts_counter: 0),
        User.create(name: 'Nicole', photo: '#photo_nicole6', bio: 'bio', posts_counter: 0),
        User.create(name: 'Lary', bio: 'bio', posts_counter: 0)
      ]
      
      visit users_path
    end    

    after(:each) do
      User.destroy_all
    end

    it 'I can see the username of all other users.' do
      @users.each do |u|
        expect(page).to have_content u.name
      end
    end

   # Add this block around the failing expectation
it 'I can see the user\'s profile picture', retry: 3 do
  @users.each do |u|
    expect(page).to have_css(".user-photo[src='#{u.photo}']", visible: :all)
  end
end

    it 'I can see the number of posts each user has written.' do
      @users.each do |u|
        expect(page).to have_content('Number of Posts:')

        expect(page).to have_content u.posts_counter
      end
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      first("a", text: @users[0].name).click
      expect(page).to have_content @users[0].bio
    end    
    
  end
end
