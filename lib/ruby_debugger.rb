require "ruby_debugger/version"
require "ruby_debugger/debugger"

module RubyDebugger
  @start = true

  def self.start
    @start = true
  end

  def self.stop
    @start = false
  end

  def self.start?
    @start
  end
end
