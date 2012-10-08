

Binding.class_eval do
  def debug
    loop do
      begin
        print "(irb)> "
        code = gets
        puts code
        break if code =~ /^cont\s*$/

        print " => "
        puts eval(code)
      rescue => e
        puts e
      end
    end
  end
end

