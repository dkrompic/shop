require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should fail on access of sensitive data" do
    # login user
    user = users(:one)
    get "/login" 
    assert_response :success
    post_via_redirect "/login", name: user.name, password: 'secret'
    assert_response :success
    assert_equal '/admin', path

    # logout user
    delete "/logout" 
    assert_response :redirect

    #try to look at protected resource again, should be redirected to login page
    get "/carts/1" 
    assert_response :redirect
    follow_redirect!  
    assert_equal '/login', path      
  end

  test "should logout and not be allowed back in" do
     delete "/logout" 
     assert_redirected_to store_url
     get "/users" 
     assert_redirected_to login_url
  end
  
  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    it_book = products(:intg_test)

    get "/"
    assert_response :success
    assert_template "index"
    
    xml_http_request :post, '/line_items', product_id: it_book.id
    assert_response :success 
    
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal it_book, cart.line_items[0].product
    
    get "/orders/new"
    assert_response :success
    assert_template "new"
    
    post_via_redirect "/orders",
                      order: { name:     "Dusan Krompic",
                               adress:   "S. buna",
                               email:    "dux@emailer.com",
                               pay_type: "Check" }  
    assert_response :success
    # Commented because of failure - more thorough analysis needed 
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
    
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]
    
    assert_equal "Dusan Krompic",   order.name
    assert_equal "S. buna",         order.adress
    assert_equal "dux@emailer.com", order.email
    assert_equal "Check",           order.pay_type
  end

end
