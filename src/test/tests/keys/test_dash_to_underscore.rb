require_relative '../../test_helper'

class TestDashToUnderscore < BaseTest

  def test_single_key_transform
    assert_equal 'my_key_name', HashKeyTransformer.dash_to_underscore('my-key-name')
  end

end
