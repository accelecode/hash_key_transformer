require_relative '../../test_helper'

class TestUnderscoreToCamel < BaseTest

  def test_single_key_transform
    assert_equal 'myKeyName', HashKeyTransformer.underscore_to_camel('my_key_name')
  end

end
