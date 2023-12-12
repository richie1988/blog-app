require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  it 'displays post details' do
    render
    expect(rendered).to include('<h1>Single Post</h1>')
    expect(rendered).to include('<p></p>')
    expect(rendered).to include('<p>Find me in app/views/posts/show.html.erb</p>')
  end
end
