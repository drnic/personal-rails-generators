require "rake"
require "fileutils"

desc "Import assets"
task :assets do
  FileUtils.chdir(File.dirname(__FILE__)) do
    sh "curl -L http://code.jquery.com/jquery-1.4.2.min.js > app_layout/templates/javascripts/jquery.js"
    sh "curl -L http://github.com/github/jquery-relatize_date/raw/master/jquery.relatize_date.js > app_layout/templates/javascripts/jquery.relatize_date.js"
  end
end

desc "Generate sample app_layout page"
task :sample_app_layout do
  path = File.join(ENV['HOME'], "Sites", "sample_app_layout")
  FileUtils.mkdir_p(path)
  FileUtils.chdir path do
    sh "rails . --force"
    sh "script/generate app_layout"
  end
  puts "Now add ~/Sites/sample_app_layout is added to passenger."
  sh "open http://sample_app_layout.local"
end
