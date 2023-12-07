require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }
  # Add more tests as needed
end
