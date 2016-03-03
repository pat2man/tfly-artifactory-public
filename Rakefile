require 'bundler/setup'

desc "Runs all of the foodcritic tests."
# -X spec added via: https://github.com/acrmp/foodcritic/issues/148
desc "Runs all of the foodcritic tests."
task :foodcritic do
  sh "bundle exec foodcritic -f any . -X spec"
end

desc "Runs all of the chefspec tests."
task :chefspec do
  sh "bundle exec rspec --color --format progress"
end

desc "Runs all of the serverspec tests."
task :serverspec do
  sh "kitchen test"
end

desc "Runs the entire suite of tests."
task default: ['foodcritic', 'chefspec', 'serverspec']
