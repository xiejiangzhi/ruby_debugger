
require 'spec_helper'

describe RubyDebugger::DisplayFileCode do
  before :each do
    @file = RubyDebugger::DisplayFileCode.new(__FILE__)
  end

  ###############################################################

  it 'exist?' do
    @file.exist?.should == true
    RubyDebugger::DisplayFileCode.new("asdfzxcv").exist?.should == false
  end

  context do
    it 'display line' do
      @file.display(2) do |out|
        out.should == "2  => require 'spec_helper'\n"
      end
    end

    it 'more line' do
      @file.display(1, 3) do |out|
        out.should == "1  => \n2  => require 'spec_helper'\n3  => \n"
      end
    end

    it '-2 line' do
      @file.display(-2) do |out|
        out.should == "1  => \n"
      end
    end

    it '10000 line' do
      @file.display(10000) do |out|
        out.should == "46  => \n"
      end
    end
  end

  it 'path' do
    @file.path.should == __FILE__
  end
end

