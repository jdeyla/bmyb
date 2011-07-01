# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{translate_routes}
  s.version = "3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Raul Murciano"]
  s.date = %q{2010-12-28}
  s.description = %q{Translates the Rails routes of your application into the languages defined in your locale files}
  s.email = %q{raul@murciano.net}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["lib/route_translator.rb", "lib/translate_routes.rb", "lib/translate_routes_test_helper.rb", "README.markdown", "test/translate_routes_test.rb"]
  s.homepage = %q{http://github.com/raul/translate_routes}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Translate your Rails routes in a simple manner}
  s.test_files = ["test/translate_routes_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
