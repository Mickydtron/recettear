require 'test_helper'

class InventoryItemsControllerTest < ActionController::TestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_item" do
    assert_difference('InventoryItem.count') do
      post :create, inventory_item: { price: @inventory_item.price, sold: @inventory_item.sold, item_id: @inventory_item.item_id, sales_cycle_id: @inventory_item.sales_cycle_id, location: @inventory_item.location }
    end

    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should show inventory_item" do
    get :show, id: @inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_item
    assert_response :success
  end

  test "should update inventory_item" do
    patch :update, id: @inventory_item, inventory_item: { price: @inventory_item.price, sold: @inventory_item.sold }
    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should destroy inventory_item" do
    assert_difference('InventoryItem.count', -1) do
      delete :destroy, id: @inventory_item
    end

    assert_redirected_to inventory_items_path
  end
end
