# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rubyswig/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brian Wong"]
  gem.email         = ["bdwong.net@gmail.com"]
  gem.description   = %q{Builds SWIG (Simplified Wrapper Interface Generator) from source with minimal dependencies,
                         then installs it as a rubygem executable, allowing it to be versioned with rvm gemsets.
                         More importantly, makes installing SWIG dead-easy, and allows you to use Gemfiles and
                         Bundler to specify dependencies against it.
                        }
  gem.summary       = %q{Build and install SWIG from source for Ruby}
  gem.homepage      = ""

  gem.extensions    << "ext/Rakefile"
  gem.files         = `git ls-files`.split($\)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.executables   = ["swig"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rubyswig"
  gem.require_paths = ["lib"]
  gem.version       = Rubyswig::VERSION
  gem.bindir        = "bin"
  gem.add_dependency "parallel"
end
