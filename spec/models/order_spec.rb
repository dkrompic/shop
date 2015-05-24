require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:adress) }

  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to validate_inclusion_of(:pay_type).in_array(Order::PAYMENT_TYPES) }
end
