$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ruby_wedding/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ruby_wedding"
  s.version     = RubyWedding::VERSION
  s.authors     = ["Chris Stainthorpe"]
  s.email       = ["chris@randomcat.co.uk"]
  s.homepage    = "http://www.randomcat.co.uk"
  s.summary     = "Manage your wedding in a rails app"
  s.description = "Invitations. Menus. "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
end
