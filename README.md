# Rubyswig

Builds SWIG (Simplified Wrapper Interface Generator) from source with minimal dependencies,
then installs it as a rubygem executable, allowing it to be versioned with rvm gemsets.

More importantly, makes installing SWIG dead-easy, and allows you to use Gemfiles and
Bundler to specify dependencies against it.

Tested on Ubuntu 12.04, OSX Snow Leopard (10.6), and Windows 7 (x86-64) with Devkit.

## Installation

Add this line to your application's Gemfile:

    gem 'rubyswig'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyswig

## Usage

Once SWIG is installed, use it as normal. See http://www.swig.org.

If you have gems that need to create SWIG wrappers, you can add rubyswig as a dependency of your gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Additional Credits

Jon Maken for download.rb (https://gist.github.com/2202048)