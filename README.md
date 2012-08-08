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

## Makefiles and extconf.rb

You can include swig in your extconf.rb to automatically generate and compile wrappers from the .i interface file. Example:

```ruby
require 'mkmf'

dir_config('ois', '/usr/include/OIS', '/usr/lib')

# Identify SWIG interface files as source files
SRC_EXT.concat %w[i]

# make dependency file for SWIG wrappers
open("depend", "w") do |f|
  f.puts("SWIG = #{find_executable('swig')}")
  f.puts("SWIGFLAGS = -D__GNUC__=4 -D__GNUC_MINOR__=6 -D__GNUC_PATCHLEVEL__=3 -ruby -Wall -c++ -minherit")
  f.puts(".i.cxx:")
  f.puts("\t$(ECHO) wrapping $(<)")
  f.puts("\t$(SWIG) $(SWIGFLAGS) $(INCFLAGS) $(CPPFLAGS) -o $@ $(<)")

have_library('OIS')

create_makefile('ois')
```

Note that SWIG does not define the same symbols as, say, GCC, so you need to define them yourself for platform-specific compilation.

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
