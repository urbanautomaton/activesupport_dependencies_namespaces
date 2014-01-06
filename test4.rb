require 'active_support/buffered_logger'
require 'active_support/dependencies'

log_out = StringIO.new

ActiveSupport::Dependencies.clear
ActiveSupport::Dependencies.autoload_paths << Pathname.new("test4").expand_path
ActiveSupport::Dependencies.logger = ActiveSupport::Logger.new(log_out)
ActiveSupport::Dependencies.log_activity = true

puts "\nCLEARING!\n"
ActiveSupport::Dependencies.clear

Qux

Foo::Bar.print_qux
Foo::Bar.print_qux

puts "\nCLEARING!\n"
ActiveSupport::Dependencies.clear

begin
  Foo::Bar.print_qux
  Foo::Bar.print_qux
rescue NameError => e
  puts e
end

puts "\nAS::D log output"
puts "================\n"

log_out.rewind
STDOUT.write(log_out.read)

