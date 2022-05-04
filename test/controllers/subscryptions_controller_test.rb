require "test_helper"

class SubscryptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscryption = subscryptions(:one)
  end

  test "should get index" do
    get subscryptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscryption_url
    assert_response :success
  end

  test "should create subscryption" do
    assert_difference("Subscryption.count") do
      post subscryptions_url, params: { subscryption: { level: @subscryption.level, library_id: @subscryption.library_id, price: @subscryption.price } }
    end

    assert_redirected_to subscryption_url(Subscryption.last)
  end

  test "should show subscryption" do
    get subscryption_url(@subscryption)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscryption_url(@subscryption)
    assert_response :success
  end

  test "should update subscryption" do
    patch subscryption_url(@subscryption), params: { subscryption: { level: @subscryption.level, library_id: @subscryption.library_id, price: @subscryption.price } }
    assert_redirected_to subscryption_url(@subscryption)
  end

  test "should destroy subscryption" do
    assert_difference("Subscryption.count", -1) do
      delete subscryption_url(@subscryption)
    end

    assert_redirected_to subscryptions_url
  end
end
