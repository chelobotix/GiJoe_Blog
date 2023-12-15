require 'test_helper'

describe 'Create category', :integration do
  it 'get new category form and create a new category' do
    get '/categories/new'
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Characters' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Characters', response.body
  end

  it 'get new category form and reject invalid category submission' do
    get '/categories/new'
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: '' } }
    end
    assert_select 'div#toast-dangers'
    assert_match 'errors', response.body
  end
end
