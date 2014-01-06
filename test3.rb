require 'active_support/buffered_logger'
require 'active_support/dependencies'

log_out = StringIO.new

ActiveSupport::Dependencies.clear
ActiveSupport::Dependencies.autoload_paths << Pathname.new("test3").expand_path
ActiveSupport::Dependencies.logger = ActiveSupport::Logger.new(log_out)
ActiveSupport::Dependencies.log_activity = true

puts "\nCLEARING!\n"
ActiveSupport::Dependencies.clear

Qux

module Foo::Bar
  puts Qux
  puts Qux
end

puts "\nCLEARING!\n"
ActiveSupport::Dependencies.clear

begin
  module Foo::Bar
    puts Qux
    puts Qux
  end
rescue NameError => e
  puts e
end

puts "\nAS::D log output"
puts "================\n"

log_out.rewind
STDOUT.write(log_out.read)
