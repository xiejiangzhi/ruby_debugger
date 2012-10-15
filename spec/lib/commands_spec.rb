
require 'spec_helper'

class SpecObj
  attr_accessor :cont
  attr_accessor :code
end

describe RubyDebugger::Commands do
  before :each do
    @obj = SpecObj.new
    @obj.code = "'test code'"
  end

  it "cont command" do
    RubyDebugger::Commands.call("cont", :args => @obj)
    @obj.cont.should == true
    @obj.code.should == ""
  end

  it 'exit' do
    RubyDebugger::Commands.call("exit", :args => @obj)
  end
end
