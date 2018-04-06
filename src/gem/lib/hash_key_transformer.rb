require 'hash_key_transformer/version'

class HashKeyTransformer
  class << self

    def transform_camel_to_underscore(subject)
      deep_transform_hash_keys(subject, :camel_to_underscore)
    end

    def transform_underscore_to_camel(subject)
      deep_transform_hash_keys(subject, :underscore_to_camel)
    end

    def transform_dash_to_underscore(subject)
      deep_transform_hash_keys(subject, :dash_to_underscore)
    end

    def transform_underscore_to_dash(subject)
      deep_transform_hash_keys(subject, :underscore_to_dash)
    end

    # 'keyName' -> 'key_name'
    def camel_to_underscore(key)
      key.to_s.gsub(/([A-Z])/) { "_#{$1}" }.downcase
    end

    # 'key_name' -> 'keyName'
    def underscore_to_camel(key)
      key.to_s.gsub(/_([a-z0-9])/) { $1.upcase }
    end

    # 'key-name' -> 'key_name'
    def dash_to_underscore(key)
      key.to_s.downcase.gsub(/-([a-z0-9])/) { "_#{$1}" }
    end

    # 'key_name' -> 'key-name'
    def underscore_to_dash(key)
      key.to_s.downcase.gsub(/_([a-z0-9])/) { "-#{$1}" }
    end

    private

    # Recursively walk the JSON-like data structure (hash, array) and transform the hash keys using the given strategy
    def deep_transform_hash_keys(subject, output_key_strategy)
      if subject.is_a?(Hash)
        subject.inject({}) do |memo, (key, value)|
          new_key = send(output_key_strategy, key).to_sym
          memo[new_key] = deep_transform_hash_keys(value, output_key_strategy)
          memo
        end
      elsif subject.is_a?(Array)
        subject.inject([]) do |memo, item|
          memo << deep_transform_hash_keys(item, output_key_strategy)
          memo
        end
      else
        # not a hash or array - do nothing
        subject
      end
    end
  end
end
