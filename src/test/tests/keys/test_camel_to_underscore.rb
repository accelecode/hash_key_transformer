require_relative '../../test_helper'

class TestCamelToUnderscore < BaseTest

  def test_single_key_transform
    assert_equal 'my_key_name', HashKeyTransformer.camel_to_underscore('myKeyName')
  end

end
