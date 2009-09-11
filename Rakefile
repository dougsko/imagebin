require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "imagebin"
    gem.summary = %Q{Command line interface to imagebin.ca}
    gem.email = "dougtko@gmail.com"
    gem.homepage = "http://github.com/dougsko/imagebin"
    gem.authors = ["dougsko"]
    gem.add_dependency 'httpclient'
    gem.description = 'Command line interface to imagebin.ca'
    gem.require_paths = ['/bin', '/lib']
    gem.files = FileList["[A-Z]*", "{bin,generators,lib,spec}/**/*"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.spec_opts = ['--color']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
  spec.spec_opts = ['--color']
end


task :default => :spec

require 'rake/rdoctask'
require 'darkfish-rdoc'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "imagebin #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.options += [
          '-N',
          '-f', 'darkfish',
  ]
end

