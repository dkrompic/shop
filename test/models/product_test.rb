require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes marked as mandatory must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test "product price must be greater then or equal to 0.01" do
    product = Product.new(title: "Price test",
                          description: "Price validation testing")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price] 

  end

  test "product must have unique title" do
    product = Product.new(title: products(:new_row).title,
                          description: "Price validation testing",
                          price: 11.00)
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]

  end

end
