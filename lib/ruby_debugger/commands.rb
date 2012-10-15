
require 'route_manager'

module RubyDebugger
  Commands = RouteManager::Manager.create_routes do
    add "cont" do |d_context|
      puts "leave debugger"
      d_context.cont = true
      d_context.code = ""
    end

    add "exit" do |d_context|
      puts "exit!"
    end
  end
end
