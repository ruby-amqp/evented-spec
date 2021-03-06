# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name        = "evented-spec"
  gem.version     = File.open('VERSION').read.strip
  gem.summary     = %q{Simple API for writing asynchronous EventMachine/AMQP specs. Supports RSpec and RSpec2.}
  gem.description = %q{Simple API for writing asynchronous EventMachine and AMQP specs. Runs legacy EM-Spec based examples. Supports RSpec and RSpec2.}
  gem.authors     = ["Arvicco", "Markiz"]
  gem.email       = "arvitallian@gmail.com"
  gem.homepage    = %q{http://github.com/ruby-amqp/evented-spec}
  gem.platform    = Gem::Platform::RUBY
  gem.date        = Time.now.strftime "%Y-%m-%d"

  # Files setup
  versioned         = `git ls-files -z`.split("\0")
  gem.files         = Dir['{bin,lib,man,spec,features,tasks}/**/*', 'Rakefile', 'README*',
                          'LICENSE*', 'VERSION*', 'HISTORY*', '.gitignore'] & versioned
  gem.test_files    = Dir['spec/**/*'] & versioned
  gem.require_paths = ["lib"]

  # RDoc setup
  gem.rdoc_options.concat %W{--charset UTF-8 --main README.textile --title evented-spec}
  gem.extra_rdoc_files = ["LICENSE", "HISTORY", "README.textile"]

  # Dependencies
  gem.add_development_dependency("rspec", ["~> 2.5.0"])
  gem.add_development_dependency("amqp", ["~> 0.8.0.rc1"])
  gem.add_development_dependency("bundler", [">= 1.0.0"])
  gem.add_development_dependency("RedCloth", ["~> 4.2.7"])
  gem.add_development_dependency("yard")

  gem.rubyforge_project = "evented-spec"
end
