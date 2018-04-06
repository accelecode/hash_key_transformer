
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hash_key_transformer/version"

Gem::Specification.new do |spec|
  spec.name          = "hash_key_transformer"
  spec.version       = HashKeyTransformer::VERSION
  spec.authors       = ["Kevin Rood"]
  spec.email         = ["kevin.rood@accelecode.com"]

  spec.summary       = %q{hash_key_transformer makes it easy to transform a JSON-like data structure from one style of key to another (for example, from camelCase to snake_case).}
  spec.description   = %q{hash_key_transformer makes it easy to transform a JSON-like data structure from one style of key to another (for example, from camelCase to snake_case).}
  spec.homepage      = "https://github.com/accelecode/hash_key_transformer"
  spec.license       = "Apache-2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
end
