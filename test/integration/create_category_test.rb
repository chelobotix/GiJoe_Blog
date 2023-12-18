require 'test_helper'

describe 'Create category', :integration do
  def setup
    @admin = User.create!(username: 'Marce', email: 'daddas@dasd.com', password: '1234', admin: true, faction: 'Cobra')
  end

  it 'get new category form and create a new category' do
    sign_in_as(@admin)
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
    sign_in_as(@admin)
    get '/categories/new'
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: '' } }
    end
    assert_select 'div#toast-danger'
    assert_match 'errors', response.body
  end
end
