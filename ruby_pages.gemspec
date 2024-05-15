# frozen_string_literal: true

require_relative "lib/ruby_pages/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_pages"
  spec.version = RubyPages::VERSION
  spec.authors = ["Oleksandr Avoiants"]
  spec.email = ["shhavel@gmail.com"]

  spec.summary = "Simple Ruby Web Framework"
  spec.description = "Simple Ruby Web Framework designed mainly for learning Web Development for everyone. Inspired by PHP. To make a new Web page just create an html file which supports ERB. E.g. for https:://yoursite.com/products.html create page products.html with any Ruby code."
  spec.homepage = "https://github.com/shhavel/ruby_pages"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/shhavel/ruby_pages"
  spec.metadata["changelog_uri"] = "https://github.com/shhavel/ruby_pages/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "rack", "~> 3.0"
  spec.add_dependency "rackup", "~> 2.1"
  spec.add_dependency "activerecord", "~> 7.1"
  spec.add_dependency "pg", "~> 1.5"
  spec.add_dependency "mysql2", "~> 0.5"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
