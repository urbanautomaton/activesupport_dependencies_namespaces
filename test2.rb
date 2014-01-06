require 'active_support/buffered_logger'
require 'active_support/dependencies'

ActiveSupport::Dependencies.clear
ActiveSupport::Dependencies.autoload_paths << Pathname.new("test2").expand_path
ActiveSupport::Dependencies.logger = ActiveSupport::Logger.new(STDOUT)
ActiveSupport::Dependencies.log_activity = true

puts "\nFIRST TIME! - no prior reference to Three\n"

module One
  module Two
    puts Three # => ::One::Two::Three
  end
end

puts "\nCLEARING!\n"

ActiveSupport::Dependencies.clear

puts "\nSECOND TIME! - ::Three already loaded\n"

Three

module One
  module Two
    puts Three # => ::Three
  end
end

puts "\nCLEARING!\n"

ActiveSupport::Dependencies.clear

