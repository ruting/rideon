# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rb-appscript"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = "2011-03-19"
  s.extensions = ["extconf.rb"]
  s.files = ["extconf.rb"]
  s.homepage = "http://appscript.sourceforge.net/"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "2.0.0"
  s.summary = "Ruby appscript (rb-appscript) is a high-level, user-friendly Apple event bridge that allows you to control scriptable Mac OS X applications using ordinary Ruby scripts."
end
