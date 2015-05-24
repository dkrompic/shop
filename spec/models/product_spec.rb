require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(6).with_message("at least 6 characters") }
  it { is_expected.to validate_uniqueness_of(:title) }

  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
end
