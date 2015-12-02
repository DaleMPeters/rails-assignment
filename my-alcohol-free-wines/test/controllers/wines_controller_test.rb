require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, wine: { bottle_size: @wine.bottle_size, company: @wine.company, grape_type: @wine.grape_type, is_vegetarian: @wine.is_vegetarian, long_description: @wine.long_description, origin_country: @wine.origin_country, picture_id: @wine.picture_id, price: @wine.price, short_description: @wine.short_description }
    end

    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, id: @wine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine
    assert_response :success
  end

  test "should update wine" do
    patch :update, id: @wine, wine: { bottle_size: @wine.bottle_size, company: @wine.company, grape_type: @wine.grape_type, is_vegetarian: @wine.is_vegetarian, long_description: @wine.long_description, origin_country: @wine.origin_country, picture_id: @wine.picture_id, price: @wine.price, short_description: @wine.short_description }
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, id: @wine
    end

    assert_redirected_to wines_path
  end
end
