require_relative '../../test_helper'

class TestTransformUnderscoreToDash < BaseTest

  def test_string_transform_does_nothing
    value = 'my_key_name'
    assert_transformed_value_is_equal(value)
  end

  def test_integer_transform_does_nothing
    value = 123
    assert_transformed_value_is_equal(value)
  end

  def test_object_transform_does_nothing
    value = Object.new
    assert_transformed_value_is_equal(value)
  end

  def test_array_transform_shallow
    initial_value = [{'key_name1' => 1, 'key_name2' => 2}, {'key_name3' => 3, 'key_name4' => 4}]
    expected_value = [{'key-name1': 1, 'key-name2': 2}, {'key-name3': 3, 'key-name4': 4}]

    assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
  end

  def test_array_transform_deep
    initial_value = [[[[[{'key_name1' => 1}, {'key_name2' => [[[{'key_name3' => 3}]]]}]]]]]
    expected_value = [[[[[{'key-name1': 1}, {'key-name2': [[[{'key-name3': 3}]]]}]]]]]

    assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
  end

  def test_hash_transform_shallow
    initial_value = {'key_name1' => 1, 'key_name2' => 2}
    expected_value = {'key-name1': 1, 'key-name2': 2}

    assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
  end

  def test_hash_transform_deep
    initial_value = {'key_name1' => 1, 'key_name2' => {'key_name3' => {'key_name4' => {'key_name5' => 5}}}}
    expected_value = {'key-name1': 1, 'key-name2': {'key-name3': {'key-name4': {'key-name5': 5}}}}

    assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
  end

  def test_complex_transform_deep
    initial_value = {'key_name1' => 1, 'key_name2' => [{'key_name3' => [{'key_name4' => 4, 'key_name5' => 5}]}]}
    expected_value = {'key-name1': 1, 'key-name2': [{'key-name3': [{'key-name4': 4, 'key-name5': 5}]}]}

    assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
  end

  private

  def assert_initial_value_is_transformed_to_expected_value(initial_value, expected_value)
    assert_equal expected_value, HashKeyTransformer.transform_underscore_to_dash(initial_value)
  end

  def assert_transformed_value_is_equal(value)
    assert_equal value, HashKeyTransformer.transform_underscore_to_dash(value)
  end

end
