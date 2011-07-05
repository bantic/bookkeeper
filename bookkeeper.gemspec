Gem::Specification.new do |s|
  s.name = "bookkeeper"
  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY
  s.authors = ['Cory Forsyth']
  s.email = ['cory.forsyth@gmail.com']
  s.homepage = 'http://github.com/bantic/bookkeeper'
  s.summary = 'requests books from nypl for you'
  s.description = 'requests books from nypl'
  s.rubyforge_project = s.name
  
  s.required_rubygems_version = ">= 1.3.6"

  s.files = Dir["{lib}/**/*.rb", "{lib}/**/*.rake", "{lib}/**/*.yml", "LICENSE", "*.md"]

  s.require_path = "lib"
end

