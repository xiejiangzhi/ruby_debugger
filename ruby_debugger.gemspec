# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_debugger/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby_debugger"
  gem.version       = RubyDebugger::VERSION
  gem.authors       = ["jiangzhi.xie"]
  gem.email         = ["xiejiangzhi@gmail.com"]
  gem.description   = %q{ruby debugger}
  gem.summary       = %q{ruby debugger}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
