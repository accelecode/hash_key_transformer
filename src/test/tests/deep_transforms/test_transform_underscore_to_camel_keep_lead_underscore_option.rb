require_relative '../../test_helper'

class TestTransformUnderscoreToCamelKeepLeadUnderscoreOption < BaseTest

  def test_string_transform_does_nothing_keep_lead_underscore_option_on
    value = 'my_key_name'
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: true)
  end

  def test_string_transform_does_nothing_keep_lead_underscore_option_off
    value = 'my_key_name'
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: false)
  end

  def test_integer_transform_does_nothing_keep_lead_underscore_option_on
    value = 123
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: true)
  end

  def test_integer_transform_does_nothing_keep_lead_underscore_option_off
    value = 123
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: false)
  end

  def test_object_transform_does_nothing_keep_lead_underscore_option_on
    value = Object.new
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: true)
  end

  def test_object_transform_does_nothing_keep_lead_underscore_option_off
    value = Object.new
    assert_equal value, HashKeyTransformer.transform_underscore_to_camel(value, keep_lead_underscore: false)
  end

  def test_hash_transform_shallow_keep_lead_underscore_option_on
    initial_value = {'_key_name1' => 1, '_key_name2' => 2}
    expected_value = {_keyName1: 1, _keyName2: 2}

    assert_equal expected_value, HashKeyTransformer.transform_underscore_to_camel(initial_value, keep_lead_underscore: true)
  end

  def test_hash_transform_shallow_keep_lead_underscore_option_off
    initial_value = {'_key_name1' => 1, '_key_name2' => 2}
    expected_value = {keyName1: 1, keyName2: 2}

    assert_equal expected_value, HashKeyTransformer.transform_underscore_to_camel(initial_value, keep_lead_underscore: false)
  end

  def test_complex_transform_deep_keep_lead_underscore_option_on
    initial_value = {'_key_name1' => 1, '_key_name2' => [{'_key_name3' => [{'_key_name4' => 4, '_key_name5' => 5}]}]}
    expected_value = {_keyName1: 1, _keyName2: [{_keyName3: [{_keyName4: 4, _keyName5: 5}]}]}

    assert_equal expected_value, HashKeyTransformer.transform_underscore_to_camel(initial_value, keep_lead_underscore: true)
  end

  def test_complex_transform_deep_keep_lead_underscore_option_off
    initial_value = {'_key_name1' => 1, '_key_name2' => [{'_key_name3' => [{'_key_name4' => 4, '_key_name5' => 5}]}]}
    expected_value = {keyName1: 1, keyName2: [{keyName3: [{keyName4: 4, keyName5: 5}]}]}

    assert_equal expected_value, HashKeyTransformer.transform_underscore_to_camel(initial_value, keep_lead_underscore: false)
  end

end
