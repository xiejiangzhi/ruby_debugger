

Binding.class_eval do
  def debug
    return unless RubyDebugger.start?

    begin
      print "(irb)> "
      code = gets
      break if code =~ /^cont\s*$/

      print " => "
      puts eval(code)
    rescue => e
      puts e
    end while true
  end
end

