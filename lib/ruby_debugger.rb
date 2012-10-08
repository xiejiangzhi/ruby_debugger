require "ruby_debugger/version"
require "ruby_debugger/debugger"

module RubyDebugger
  @start = false

  def self.start
    @start = true
  end

  def self.start?
    @start
  end
end
