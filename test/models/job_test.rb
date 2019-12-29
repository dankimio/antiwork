require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs(:job)
  end

  test 'valid' do
    assert @job.valid?
  end

  test 'valid if salary_min is equal to salary_max' do
    @job.salary_min = @job.salary_max
    assert @job.valid?
  end

  test 'valid without salary_max' do
    @job.salary_max = nil
    assert @job.valid?
  end

  test 'invalid without salary_min' do
    @job.salary_min = nil
    assert @job.invalid?
  end

  test 'invalid when salary_min is 0' do
    @job.salary_min = 0
    assert @job.invalid?
  end

  test 'invalid when salary_max is less than salary_min' do
    @job.salary_min = 100
    @job.salary_min = @job.salary_min - 1
    assert @job.invalid?
  end
end
