require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ratlas"
    gem.summary = %Q{A Atlas api Ruby client}
    gem.description = %Q{Rutlas allows you to consume to the Atlas api without getting your hands dirty}
    gem.email = "danie@14lines.com"
    gem.homepage = "http://github.com/daniel_cooper/ratlas"
    gem.authors = ["Daniel Cooper"]
    gem.add_development_dependency "rspec"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "hashie #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end