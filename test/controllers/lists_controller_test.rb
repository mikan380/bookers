require "test_helper"

class ListsController < ApplicationController
  def new
    @booker = Booker.new  # List.new から Booker.new に変更
  end
end

  test "should get index" do
    get lists_index_url
    assert_response :success
  end

  test "should get show" do
    get lists_show_url
    assert_response :success
  end

  test "should get edit" do
    get lists_edit_url
    assert_response :success
  end
end
