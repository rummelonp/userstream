# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "userstream/version"

Gem::Specification.new do |s|
  s.name        = "userstream"
  s.version     = Userstream::VERSION
  s.authors     = ["Kazuya Takeshima"]
  s.email       = ["mail@mitukiii.jp"]
  s.homepage    = ""
  s.summary     = %q{Userstream is a simple twitter userstream library.}
  s.description = %q{Userstream is a simple twitter userstream library.}

  s.rubyforge_project = "userstream"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "oauth"
  s.add_runtime_dependency("json") if RUBY_VERSION < '1.9'
  s.add_runtime_dependency "hashie"
  s.add_development_dependency "rspec"
end
