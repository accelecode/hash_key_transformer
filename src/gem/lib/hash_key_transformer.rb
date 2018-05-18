require 'hash_key_transformer/version'

class HashKeyTransformer
  class << self

    def transform_camel_to_underscore(subject, options={})
      deep_transform_hash_keys(subject, :camel_to_underscore, options)
    end

    def transform_underscore_to_camel(subject, options={})
      deep_transform_hash_keys(subject, :underscore_to_camel, options)
    end

    def transform_dash_to_underscore(subject, options={})
      deep_transform_hash_keys(subject, :dash_to_underscore, options)
    end

    def transform_underscore_to_dash(subject, options={})
      deep_transform_hash_keys(subject, :underscore_to_dash, options)
    end

    # 'keyName' -> 'key_name'
    def camel_to_underscore(key, options = {})
      key.to_s.gsub(/([A-Z])/) { "_#{$1}" }.downcase
    end

    # 'key_name' -> 'keyName'
    def underscore_to_camel(key, options = {})
      if !!options[:keep_lead_underscore]
        key.to_s.gsub(/(?!^)_([a-z0-9])/) { $1.upcase }
      else
        first_word, *rest_words = key.to_s.split('_').reject(&:empty?).map(&:downcase)
        ([first_word] + rest_words.map(&:capitalize)).join
      end
    end

    # 'key-name' -> 'key_name'
    def dash_to_underscore(key, options = {})
      key.to_s.downcase.gsub(/-([a-z0-9])/) { "_#{$1}" }
    end

    # 'key_name' -> 'key-name'
    def underscore_to_dash(key, options = {})
      key.to_s.downcase.gsub(/_([a-z0-9])/) { "-#{$1}" }
    end

    private

    # Recursively walk the JSON-like data structure (hash, array) and transform the hash keys using the given strategy
    def deep_transform_hash_keys(subject, output_key_strategy, options = {})
      if subject.is_a?(Hash)
        subject.inject({}) do |memo, (key, value)|
          new_key = send(output_key_strategy, key, options).to_sym
          memo[new_key] = deep_transform_hash_keys(value, output_key_strategy, options)
          memo
        end
      elsif subject.is_a?(Array)
        subject.inject([]) do |memo, item|
          memo << deep_transform_hash_keys(item, output_key_strategy, options)
          memo
        end
      else
        # not a hash or array - do nothing
        subject
      end
    end
  end
end
