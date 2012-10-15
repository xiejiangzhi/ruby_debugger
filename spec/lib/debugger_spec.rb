
require 'spec_helper'

module Readline
  def self.readline(*args)
    @codes.shift
  end

  def self.set_codes(codes)
    @codes = codes
  end
end

describe RubyDebugger::Context do
  before :each do
    test_var = "tes_var"
    @val = test_var
    @val2 = {:a => 1123}

    @debugger = RubyDebugger::Context.new binding
  end

  it "run code" do
    @debugger.binding_eval("test_var") == @val
    @debugger.binding_eval("test_var = 123").should == 123
  end

  it 'debug' do
    Readline.set_codes(["@val2[:a] = 10\n", "cont\n"])
    @debugger.debug
    @val2[:a].should == 10
  end
end
