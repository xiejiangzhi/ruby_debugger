
require 'spec_helper'

describe RubyDebugger::Context do
  before :each do
    test_var = "tes_var"
    @val = test_var

    @debugger = RubyDebugger::Context.new binding
  end

  it "run code" do
    @debugger.binding_eval("test_var") == @val
    @debugger.binding_eval("test_var = 123").should == 123
  end

  it 'debug' do
    #@debugger.debug
  end
end
