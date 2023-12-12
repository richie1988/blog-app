require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'displays a list of posts' do
    render
    expect(rendered).to include('<h1>List of Posts</h1>')
    expect(rendered).to include('<p>Find me in app/views/posts/index.html.erb</p>')
  end
end
