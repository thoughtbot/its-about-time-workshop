require "rspec/core/rake_task"

EXERCISES = Dir["exercises/*"]
  .select { |path| File.directory?(path) }
  .sort
  .map do |path|
  [path, "e#{File.basename(path)[/\A\d+/].to_i}"]
end

EXERCISES.each do |path, short_name|
  name = File.basename(path)

  desc "Run exercise #{name}"
  RSpec::Core::RakeTask.new(short_name) do |t|
    t.pattern = "#{path}/spec/**/*_spec.rb"
    t.verbose = false
  end
end

desc "Check that your machine is ready for the workshop"
task :doctor do
  ruby "bin/doctor"
end

desc "Lint with RuboCop"
task :rubocop do
  sh "rubocop"
end

desc "Run every exercise"
task default: EXERCISES.map(&:last)
