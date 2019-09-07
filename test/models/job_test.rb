require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs(:job)
  end

  test 'valid' do
    assert @job.valid?
  end
end
