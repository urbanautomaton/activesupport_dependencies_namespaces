require 'active_support/dependencies'

ActiveSupport::Dependencies.clear
ActiveSupport::Dependencies.autoload_paths << Pathname.new("lib").expand_path

module HTML
end

module SomeModule
end

puts "Loading first time!"
HTML::SomeClass
SomeModule::OtherClass

puts "\nAutoloaded: #{ActiveSupport::Dependencies.autoloaded_constants.join(", ")}"

puts "\nClearing!"
ActiveSupport::Dependencies.clear

puts "Loading second time!"
HTML::SomeClass
SomeModule::OtherClass

puts "\nAutoloaded: #{ActiveSupport::Dependencies.autoloaded_constants.join(", ")}"

