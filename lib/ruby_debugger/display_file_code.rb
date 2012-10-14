
module RubyDebugger
  class DisplayFileCode
    def initialize(path)
      @path = path
    end

    def display(start, stop = nil, &block)
      return unless exist?

      start, stop = correction_line(start, stop)

      each_line do |f, l|
        break if f.lineno > stop
        
        if f.lineno >= start && f.lineno <= stop
          block.nil? ? print(l) : block(l)
        end
      end
    end

    def exist?
      File.exist?(@path)
    end

    def path
      @path
    end

    ########################################################
    #
    # private
    #
    ########################################################

    def correction_line(start, stop)
      start = [start, 1].max
      [(stop ? stop : start), start]
    end

    def each_line(&block)
      File.open(@path) do |f|
        f.each_line {|l| block.call(f, l) }
      end
    end
  end
end
