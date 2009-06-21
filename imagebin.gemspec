# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{imagebin}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["dougsko"]
  s.date = %q{2009-06-20}
  s.default_executable = %q{imagebin}
  s.description = %q{Command line interface to imagebin.ca}
  s.email = %q{dougtko@gmail.com}
  s.executables = ["imagebin"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/imagebin",
    "spec/imagebin_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dougsko/imagebin}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/imagebin_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
    else
      s.add_dependency(%q<httpclient>, [">= 0"])
    end
  else
    s.add_dependency(%q<httpclient>, [">= 0"])
  end
end
