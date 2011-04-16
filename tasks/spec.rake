desc 'Alias to spec:spec'
task :spec => 'spec:all'

namespace :spec do
  require 'rspec/core/rake_task'

  desc "Run all specs"
  RSpec::Core::RakeTask.new(:all){|task|}

  desc "Run all non-failing specs (for CI)"
  RSpec::Core::RakeTask.new(:ci) do |task|
    ENV["EXCLUDE_DELIBERATELY_FAILING_SPECS"] = "1"
  end

  desc "Run specs with RCov"
  RSpec::Core::RakeTask.new(:rcov) do |t|
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
end
