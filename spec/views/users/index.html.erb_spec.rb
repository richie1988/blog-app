require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  it 'displays a list of users' do
    render
    expect(rendered).to include('<h1>List of Users</h1>')
    expect(rendered).to include('<p>Find me in app/views/users/index.html.erb</p>')
  end
end
