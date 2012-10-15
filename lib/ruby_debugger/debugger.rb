
require 'rb-readline'
require 'ruby_debugger/commands'
require 'ruby_debugger/display_file_code'

Binding.class_eval do
  def debug
    RubyDebugger::Context.new(self).debug
  end
end

module RubyDebugger
  class Context
    attr_accessor :cont
    attr_accessor :code

    def initialize(code_binding)
      @code_binding = code_binding
      @code_file = DisplayFileCode.new(binding_eval("__FILE__"))
      @line = binding_eval("__LINE__")
    end

    def debug
      return unless RubyDebugger.start?

      display_context

      loop do
        result = eval_code

        break if @cont

        puts " => #{result}"
      end

      @cont = false
    end

    def binding_eval(c)
      eval(c, @code_binding)
    end

    ##########################################################
    #
    # private
    #
    ##########################################################
    private

    def eval_code
      binding_eval(readcode)
    rescue => e
      puts e
    end

    def readcode
      msg = "(irb)> "
      
      if Kernel.const_defined? :Readline
        @code = Readline.readline(msg, true)
      else
        print msg
        @code = gets
      end

      #Commands.has(code) ?
      RubyDebugger::Commands.call(@code, :args => self)

      @code
    end

    ShowSpace = 4
    def display_context
      show_binding_file_line

      @code_file.display(@line - ShowSpace, @line + ShowSpace)
    end

    def show_binding_file_line
      binding_eval "puts \" => in file: \#{__FILE__}, line: \#{__LINE__}\""
    end
  end
end

