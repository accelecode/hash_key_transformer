require_relative '../../test_helper'

class TestUnderscoreToDash < BaseTest

  def test_single_key_transform
    assert_equal 'my-key-name', HashKeyTransformer.underscore_to_dash('my_key_name')
  end

end
