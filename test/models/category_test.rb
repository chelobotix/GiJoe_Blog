require 'test_helper'

describe Category do
  def setup
    @category = Category.new(name: 'Sports')
  end

  it 'category should be valid' do
    assert @category.valid?
  end

  it 'Name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  it 'Name should be unique' do
    @category.save!
    @category2 = Category.new(name: 'Sport')
    assert_not @category2.valid?
  end

  it 'Name should not bee too long' do
    @category.name = 'S' * 26
    assert_not @category.valid?
  end

  it 'Name should not be too short' do
    @category.name = 'Sp'
    assert_not @category.valid?
  end
end
