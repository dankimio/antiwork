require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:company)
  end

  test 'valid' do
    assert @company.valid?
  end
end
