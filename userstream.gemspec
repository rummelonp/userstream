# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "user_stream/version"

Gem::Specification.new do |s|
  s.name        = "userstream"
  s.version     = UserStream::VERSION
  s.authors     = ["Kazuya Takeshima"]
  s.email       = ["mail@mitukiii.jp"]
  s.homepage    = "https://github.com/mitukiii/userstream"
  s.summary     = %q{UserStream is a simple twitter userstream library.}
  s.description = %q{UserStream is a simple twitter userstream library.}

  s.rubyforge_project = "userstream"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency("oauth", "~> 0.4.5")
  s.add_runtime_dependency("json", "~> 1.6.4") if RUBY_VERSION < '1.9'
  s.add_runtime_dependency("hashie", "~> 1.2.0")
  s.add_development_dependency("rspec", "~> 2.8.0")
end
