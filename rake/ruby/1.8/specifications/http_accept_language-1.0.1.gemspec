# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{http_accept_language}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Iain Hecker"]
  s.date = %q{2010-02-25}
  s.description = %q{Find out which locale the user preferes by reading the languages they specified in their browser}
  s.email = %q{iain@iain.nl}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = [".gitignore", "README.rdoc", "Rakefile", "VERSION", "http_accept_language.gemspec", "lib/http_accept_language.rb", "rails/init.rb", "test/http_accept_language_test.rb"]
  s.homepage = %q{http://github.com/iain/http_accept_language}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Parse the HTTP Accept Language Header}
  s.test_files = ["test/http_accept_language_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
