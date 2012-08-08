# Rubyswig

Builds [SWIG](http://www.swig.org) (Simplified Wrapper Interface Generator) from source with minimal dependencies,
then installs it as a rubygem executable, allowing it to be versioned with rvm gemsets.

More importantly, makes installing SWIG dead-easy, and allows you to use Gemfiles and
Bundler to specify dependencies against it.

Tested with Ruby 1.9.3 on Ubuntu 12.04, OSX Snow Leopard (10.6), and Windows 7 (x86-64) with [Devkit](http://rubyinstaller.org/add-ons/devkit/).

## Prerequisites

### All

Ruby and an environment that can build native gems.

### Windows

If you're starting your Ruby environment from scratch, I recommend the [RailsInstaller](http://railsinstaller.org/), which includes Devkit. You can also install Devkit [manually](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit), but there are more steps involved.

## Installation

Add this line to your application's Gemfile:

    gem 'rubyswig'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyswig

## Usage

Once SWIG is installed, use it as normal. See <http://www.swig.org>. Remember that if you use rvm gemsets that the executable is tied to the gemset in which you installed it.

If you have gems that need to create SWIG wrappers, you can add rubyswig as a dependency of your gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Additional Credits

Jon Maken for download.rb (https://gist.github.com/2202048)

## Alternatives

[Rice](http://rice.rubyforge.org/) is a C++ wrapper interface to the Ruby API. It's easier to use but is specific to Ruby. 
