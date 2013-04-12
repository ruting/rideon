# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "merit"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tute Costa"]
  s.date = "2013-03-30"
  s.description = "Manage badges, points and rankings (reputation) of resources in a Rails application."
  s.email = "tutecosta@gmail.com"
  s.homepage = "http://github.com/tute/merit"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.0.0"
  s.summary = "General reputation Rails engine."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ambry>, ["~> 0.3.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.3"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<minitest-spec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, ["= 0.13.3"])
      s.add_development_dependency(%q<bson_ext>, [">= 0"])
      s.add_development_dependency(%q<mongoid>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<ambry>, ["~> 0.3.0"])
      s.add_dependency(%q<rails>, ["~> 3.2.3"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<minitest-spec>, [">= 0"])
      s.add_dependency(%q<mocha>, ["= 0.13.3"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<mongoid>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<ambry>, ["~> 0.3.0"])
    s.add_dependency(%q<rails>, ["~> 3.2.3"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<minitest-spec>, [">= 0"])
    s.add_dependency(%q<mocha>, ["= 0.13.3"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<mongoid>, ["~> 2.0.0"])
  end
end
