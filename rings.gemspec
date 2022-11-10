# frozen_string_literal: true

require_relative 'lib/rings/version'

Gem::Specification.new do |spec|
  spec.name = 'rings'
  spec.version = Rings::VERSION
  spec.authors = ['hahwul']
  spec.email = ['hahwul@gmail.com']

  spec.summary = 'CLI Based Project manager'
  spec.description = 'CLI Based Project manager'
  spec.homepage = 'https://github.com/hahwul/rings'
  spec.required_ruby_version = '>= 2.6.0'
  spec.license = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hahwul/rings'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = 'rings'
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency 'config', '~> 4.0.0'
  spec.add_runtime_dependency 'thor', '~> 1.2.1'
  spec.add_runtime_dependency 'sequel', '~> 5.62.0'
  spec.add_runtime_dependency 'sqlite3', '~> 1.5.3'
end
