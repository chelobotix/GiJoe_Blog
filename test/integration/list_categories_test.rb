require 'test_helper'

describe 'List categories', :integration do
  def setup
    @category = Category.create!(name: 'Sports')
    @category2 = Category.create!(name: 'Business')
  end

  it 'should show categories listing' do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
