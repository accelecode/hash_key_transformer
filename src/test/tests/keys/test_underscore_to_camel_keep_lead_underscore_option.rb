require_relative '../../test_helper'

class TestUnderscoreToCamelKeepLeadUnderscoreOption < BaseTest

  def test_single_key_transform_keep_lead_underscore_option_on
    assert_equal '_myKeyName', HashKeyTransformer.underscore_to_camel('_my_key_name', keep_lead_underscore: true)
  end

  def test_single_key_transform_keep_lead_underscore_option_off
    assert_equal 'myKeyName', HashKeyTransformer.underscore_to_camel('_my_key_name', keep_lead_underscore: false)
  end

end
