require 'test_helper'

describe CategoriesController do
  def setup
    @category = Category.create!(name: 'Sports')
  end

  it 'gets index' do
    get categories_url
    must_respond_with :success
  end

  it 'gets new' do
    get new_category_url
    must_respond_with :success
  end

  it 'gets show' do
    get category_url(@category)
    must_respond_with :success
  end

  it 'should create a new category' do
    assert_difference('Category.count', 1) do
      post categories_path, params: { category: { name: 'Business' } }
    end
    assert_redirected_to(Category.last)
  end
end
