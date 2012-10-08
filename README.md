# RubyDebugger

简单的ruby调试器

突然感觉调试器也很简单的

于是自己弄一个简单的看看。。

也就是断点，给一个irb

## Installation

Add this line to your application's Gemfile:
  
  gem "ruby_debugger", :git => "https://github.com/xjz19901211/ruby_debugger"

And then execute:

    $ bundle

## Usage
  
  $ irb
  require 'bundler/setup'
  require 'ruby_debugger'

  def fn(a, b)
    binding.debug #断点进入irb环境
    puts a * b
  end

  fn(1, 2)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
