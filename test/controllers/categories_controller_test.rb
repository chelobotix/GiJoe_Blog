require 'test_helper'

describe CategoriesController do
  def setup
    @category = Category.create!(name: 'Sports')
    @admin = User.create!(username: 'Marce', email: 'daddas@dasd.com', password: '1234', admin: true, faction: 'Cobra')
  end

  it 'gets index' do
    get categories_url
    must_respond_with :success
  end

  it 'gets new' do
    sign_in_as(@admin)
    get new_category_url
    must_respond_with :success
  end

  it 'gets show' do
    get category_url(@category)
    must_respond_with :success
  end

  it 'should create a new category' do
    sign_in_as(@admin)
    assert_difference('Category.count', 1) do
      post categories_path, params: { category: { name: 'Business' } }
    end
    assert_redirected_to(Category.last)
  end

  it 'should not create a new category if not admin' do
    assert_no_difference('Category.count') do
      post categories_path, params: { category: { name: 'Business' } }
    end
    assert_redirected_to(categories_url)
  end
end
