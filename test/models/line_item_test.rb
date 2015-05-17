require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'new line item should be created when adding a new product' do
    # Add first product
    assert_difference('LineItem.count', 1) do
      product = products(:unit_test_1)
      item = LineItem.new product_id: product.id, price: product.price, cart_id: 1
      item.save!
    end
  end
end
