require 'rake/testtask'

desc 'Run all tests'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

require 'rdoc/task'
namespace :documentation do
  Rake::RDocTask.new(:generate) do |rd|
    rd.main = "README.rdoc"
    rd.rdoc_files.include("README.rdoc", "LICENSE", "lib/**/*.rb")
    rd.options << "--all" << "--charset" << "utf-8"
  end
end

task :ragel do
  sh "ragel -R lib/net/http/http_1_1_response_parser.rl"
  sh "ragel -R lib/net/http/http_1_1_request_parser.rl"
end

task default: :test