require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  it 'displays user details' do
    render
    expect(rendered).to include('<h1>User Details</h1>')
    expect(rendered).to include('<p>Find me in app/views/users/show.html.erb</p>')
  end
end
