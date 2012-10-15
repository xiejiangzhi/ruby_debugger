require 'pry'

module RubyDebugger
  class DisplayFileCode
    def initialize(path)
      @path = path
    end

    def display(start, stop = nil, &out_proc)
      return unless exist?

      start, stop = correction_line(start, stop)

      lines = get_lines(start, stop)
      out_proc.nil? ? print(lines) : out_proc.call(lines)
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
      [start, (stop ? stop : start)]
    end

    def get_lines(start, stop)
      File.open(@path) do |f|
        f.each_with_object("") do |l, str|
          return str if f.lineno > stop
          str << l if (f.lineno >= start && f.lineno <= stop) || f.eof?
        end
      end
    end
  end
end

